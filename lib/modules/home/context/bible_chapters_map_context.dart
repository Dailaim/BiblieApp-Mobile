import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterpractic/core/enums/books.dart';
import 'package:flutterpractic/core/enums/chapter.dart';
import 'package:flutterpractic/core/enums/ver.dart';
import 'package:flutterpractic/core/enums/versions.dart';
import 'package:flutterpractic/core/services/shared_preferences_service.dart';
import 'package:flutterpractic/modules/home/models/book_character_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BibleChaptersMapContext extends StateNotifier<Map<String, BibleVersion>> {
  BibleChaptersMapContext() : super(bibleVersionMap) {
    _loadData();
  }

  _loadData() async {
    final savedData =
        await SharedPreferencesService.getData('bible_chapters_map');
    if (savedData != null) {
      final decoded = jsonDecode(savedData) as Map<String, dynamic>;
      state = decoded.map<String, BibleVersion>((k, v) {
        return MapEntry(k, BibleVersion.fromJson(v));
      });
    }
  }

  void _persistData() async {
    await SharedPreferencesService.saveData(
        'bible_chapters_map', jsonEncode(state));
  }

  void saveChapters(
      {required String version,
      required String book,
      required int chapter,
      required List<BibleVer> vers}) {
    state = {
      ...state,
      version: state[version]!
        ..booksMaps[book]!.chaptersMap[chapter] = BibleChapter(
          number: chapter,
          verses: vers,
        )
    };
    _persistData();
  }

  void saveBook(
      {required String version,
      required String name,
      required Map<int, List<BibleVer>> books}) {
    state = {
      ...state,
      version: state[version]!
        ..booksMaps[name]!.chaptersMap = books.map<int, BibleChapter>(
            (k, v) => MapEntry(k, BibleChapter(number: k, verses: v))),
    };
    _persistData();
  }

  void saveToLink({
    required String version,
    required String book,
    required int chapter,
  }) async {
    if (state[version]?.booksMaps[book]?.chaptersMap[chapter] != null) return;

    try {
      final response = await Dio().get(
          "https://bible-api.deno.dev/api/${version}/book/${book}/${chapter}");

      if (response.statusCode == 200) {
        final bookCharacter = BookCharacterResponse.fromJson(response.data);

        state = {
          ...state,
          version: state[version]!
            ..booksMaps[book]!.chaptersMap[chapter] = BibleChapter(
              number: chapter,
              verses: bookCharacter.vers
                  .map((v) => v.toBibleVer())
                  .toList(growable: false),
            )
        };
        _persistData();
      } else {
        print("Error with the request: ${response.statusCode}");
      }
    } catch (e) {
      print("An error occurred while fetching data: $e");
    }
  }

  void removeChapters(
      {required String version, required String book, required int chapter}) {
    state = state = {
      ...state,
      version: state[version]!..booksMaps[book]!.chaptersMap[chapter] = null,
    };
    _persistData();
  }
}

final saveChaptersProvider =
    StateNotifierProvider<BibleChaptersMapContext, Map<String, BibleVersion>>(
        (ref) => BibleChaptersMapContext());
