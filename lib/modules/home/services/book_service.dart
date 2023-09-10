import 'package:dio/dio.dart';

class Book {
  String name;
  int numChapters;
  String testament;
  int chapter;
  List<Ver> vers;

  Book({
    required this.name,
    required this.numChapters,
    required this.testament,
    required this.chapter,
    required this.vers,
  });

  Book.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        numChapters = json['numChapters'] ?? 0,
        testament = json['testament'] ?? "",
        chapter = json['chapter'] ?? "",
        vers =
            json['vers'].map<Ver>((e) => Ver.fromJson(e)).toList() ?? <Ver>[];

  Book copyWith({
    String? name,
    int? numChapters,
    String? testament,
    int? chapter,
    List<Ver>? vers,
  }) =>
      Book(
        name: name ?? this.name,
        numChapters: numChapters ?? this.numChapters,
        testament: testament ?? this.testament,
        chapter: chapter ?? this.chapter,
        vers: vers ?? this.vers,
      );
}

class Ver {
  String verse;
  String? study;
  int number;
  int id;

  Ver({
    required this.verse,
    this.study,
    required this.number,
    required this.id,
  });

  Ver.fromJson(Map<String, dynamic> json)
      : verse = json['verse'] ?? "",
        study = json['study'] ?? "",
        number = json['number'] ?? 0,
        id = json['id'] ?? 0;

  Ver copyWith({
    String? verse,
    String? study,
    int? number,
    int? id,
  }) =>
      Ver(
        verse: verse ?? this.verse,
        study: study ?? this.study,
        number: number ?? this.number,
        id: id ?? this.id,
      );
}

final dio = Dio();

Future<Book> bookService(String url) async {
  final data = await dio.get(url);

  return Book.fromJson(data.data);
}
