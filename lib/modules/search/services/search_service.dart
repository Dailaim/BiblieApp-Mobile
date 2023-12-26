import 'package:dio/dio.dart';
import 'package:flutterpractic/core/enums/books.dart';
import 'package:flutterpractic/core/enums/versions.dart';
import 'package:flutterpractic/shared/constants/url_api.dart';

// FIXME: Create a riverpod future for this service

final Dio _dio = Dio();

Future<Search?> searchBible({
  required String query,
  String? testament,
  int? take,
  int? page,
  required TypeBibleVersion version,
}) async {
  assert(testament != null && testament.isNotEmpty,
      'The testament cannot be empty.');

  if (query.isEmpty) {
    print("The query cannot be empty.");
    print("is query empty? ${query}");
    return null;
  }

  final String baseURL = "$urlApi/api/read/${version.url}/search";

  Map<String, dynamic> queryParameters = {
    'q': query,
    'testament': testament,
  };

  if (take != null) {
    queryParameters['take'] = take;
  }
  if (page != null) {
    queryParameters['page'] = page;
  }

  try {
    final response = await _dio.get(
      baseURL,
      queryParameters: queryParameters,
    );

    return Search.fromJson(response.data);
  } catch (e) {
    print(e);
    return null;
  }
}

class Search {
  List<SearchResult> data;
  Meta meta;

  Search.fromJson(Map<String, dynamic> json)
      : data = json['data']
            .map<SearchResult>((e) => SearchResult.fromJson(e))
            .toList(),
        meta = Meta.fromJson(json['meta']);

  Search({
    required this.data,
    required this.meta,
  });
}

class SearchResult {
  String verse;
  String? study;
  int number;
  int id;
  TypeBibleBook book;
  int chapter;

  SearchResult.fromJson(Map<String, dynamic> json)
      : verse = json['verse'] ?? "",
        study = json['study'] ?? "",
        number = json['number'] ?? 0,
        id = json['id'] ?? 0,
        book = bibleBooksMap[json['book']]!,
        chapter = json['chapter'] ?? 0;

  SearchResult({
    required this.verse,
    required this.study,
    required this.number,
    required this.id,
    required this.book,
    required this.chapter,
  });
}

class Meta {
  int page;
  int pageSize;
  int total;
  int pageCount;

  Meta.fromJson(Map<String, dynamic> json)
      : page = json['page'] ?? 0,
        pageSize = json['pageSize'] ?? 0,
        total = json['total'] ?? 0,
        pageCount = json['pageCount'] ?? 0;

  Meta({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.pageCount,
  });
}
