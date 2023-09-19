import 'package:flutterpractic/core/enums/ver.dart';

class BookCharacterResponse {
  String name;
  int numChapters;
  String testament;
  int chapter;
  List<VerResponse> vers;

  BookCharacterResponse({
    required this.name,
    required this.numChapters,
    required this.testament,
    required this.chapter,
    required this.vers,
  });

  BookCharacterResponse.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        numChapters = json['numChapters'] ?? 0,
        testament = json['testament'] ?? "",
        chapter = json['chapter'] ?? "",
        vers = json['vers']
                .map<VerResponse>((e) => VerResponse.fromJson(e))
                .toList() ??
            <VerResponse>[];

  List<BibleVer> get bibleVer => vers.map((e) => e.toBibleVer()).toList();

  BookCharacterResponse copyWith({
    String? name,
    int? numChapters,
    String? testament,
    int? chapter,
    List<VerResponse>? vers,
  }) =>
      BookCharacterResponse(
        name: name ?? this.name,
        numChapters: numChapters ?? this.numChapters,
        testament: testament ?? this.testament,
        chapter: chapter ?? this.chapter,
        vers: vers ?? this.vers,
      );
}

class VerResponse {
  String verse;
  String? study;
  int number;
  int id;

  BibleVer toBibleVer() => BibleVer(
        verse: verse,
        study: study,
        number: number,
        id: id,
      );

  VerResponse({
    required this.verse,
    this.study,
    required this.number,
    required this.id,
  });

  VerResponse.fromJson(Map<String, dynamic> json)
      : verse = json['verse'] ?? "",
        study = json['study'] ?? "",
        number = json['number'] ?? 0,
        id = json['id'] ?? 0;
}
