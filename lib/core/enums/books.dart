import 'package:flutterpractic/core/enums/chapter.dart';

class TypeBibleBook {
  final String name;
  final int chapters;
  final Testament _testament;
  Map<int, BibleChapter?> chaptersMap = {};

  String get testament => _testament == Testament.ANTIGUO_TESTAMENTO
      ? 'Antiguo Testamento'
      : 'Nuevo Testamento';

  Testament get testamentType => _testament;

  TypeBibleBook({
    required this.name,
    required this.chapters,
    required Testament testament,
  }) : _testament = testament;

  void addChapter(BibleChapter chapter) {
    chaptersMap = {
      ...chaptersMap,
      chapter.number: chapter,
    };
  }

  void deleteChapter(int chapter) {
    chaptersMap.remove(chapter);
  }

  TypeBibleBook.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        chapters = json['chapters'],
        _testament = json['testament'] == 'Antiguo Testamento'
            ? Testament.ANTIGUO_TESTAMENTO
            : Testament.NUEVO_TESTAMENTO,
        chaptersMap = (json['chaptersMap'] as Map<String, dynamic>)
            .map<int, BibleChapter>(
                (k, v) => MapEntry(int.parse(k), BibleChapter.fromJson(v)));

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'chapters': chapters,
      'testament': testament,
      'chaptersMap': chaptersMap
          .map<String, dynamic>((k, v) => MapEntry(k.toString(), v?.toJson())),
    };
  }
}

enum Testament { ANTIGUO_TESTAMENTO, NUEVO_TESTAMENTO }

Map<String, TypeBibleBook> bibleBooksMap = {
  "Genesis": TypeBibleBook(
      name: "Genesis", chapters: 50, testament: Testament.ANTIGUO_TESTAMENTO),
  "Exodo": TypeBibleBook(
      name: "Exodo", chapters: 40, testament: Testament.ANTIGUO_TESTAMENTO),
  "Levitico": TypeBibleBook(
      name: "Levitico", chapters: 27, testament: Testament.ANTIGUO_TESTAMENTO),
  "Numeros": TypeBibleBook(
      name: "Numeros", chapters: 36, testament: Testament.ANTIGUO_TESTAMENTO),
  "Deuteronomio": TypeBibleBook(
      name: "Deuteronomio",
      chapters: 34,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "Josue": TypeBibleBook(
      name: "Josue", chapters: 24, testament: Testament.ANTIGUO_TESTAMENTO),
  "Jueces": TypeBibleBook(
      name: "Jueces", chapters: 21, testament: Testament.ANTIGUO_TESTAMENTO),
  "Rut": TypeBibleBook(
      name: "Rut", chapters: 4, testament: Testament.ANTIGUO_TESTAMENTO),
  "1-Samuel": TypeBibleBook(
      name: "1-Samuel", chapters: 31, testament: Testament.ANTIGUO_TESTAMENTO),
  "2-Samuel": TypeBibleBook(
      name: "2-Samuel", chapters: 24, testament: Testament.ANTIGUO_TESTAMENTO),
  "1-Reyes": TypeBibleBook(
      name: "1-Reyes", chapters: 22, testament: Testament.ANTIGUO_TESTAMENTO),
  "2-Reyes": TypeBibleBook(
      name: "2-Reyes", chapters: 25, testament: Testament.ANTIGUO_TESTAMENTO),
  "1-Cronicas": TypeBibleBook(
      name: "1-Cronicas",
      chapters: 29,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "2-Cronicas": TypeBibleBook(
      name: "2-Cronicas",
      chapters: 36,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "Esdras": TypeBibleBook(
      name: "Esdras", chapters: 10, testament: Testament.ANTIGUO_TESTAMENTO),
  "Nehemias": TypeBibleBook(
      name: "Nehemias", chapters: 13, testament: Testament.ANTIGUO_TESTAMENTO),
  "Ester": TypeBibleBook(
      name: "Ester", chapters: 10, testament: Testament.ANTIGUO_TESTAMENTO),
  "Job": TypeBibleBook(
      name: "Job", chapters: 42, testament: Testament.ANTIGUO_TESTAMENTO),
  "Salmos": TypeBibleBook(
      name: "Salmos", chapters: 150, testament: Testament.ANTIGUO_TESTAMENTO),
  "Proverbios": TypeBibleBook(
      name: "Proverbios",
      chapters: 31,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "Eclesiastes": TypeBibleBook(
      name: "Eclesiastes",
      chapters: 12,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "Cantares": TypeBibleBook(
      name: "Cantares", chapters: 8, testament: Testament.ANTIGUO_TESTAMENTO),
  "Isaias": TypeBibleBook(
      name: "Isaias", chapters: 66, testament: Testament.ANTIGUO_TESTAMENTO),
  "Jeremias": TypeBibleBook(
      name: "Jeremias", chapters: 52, testament: Testament.ANTIGUO_TESTAMENTO),
  "Lamentaciones": TypeBibleBook(
      name: "Lamentaciones",
      chapters: 5,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "Ezequiel": TypeBibleBook(
      name: "Ezequiel", chapters: 48, testament: Testament.ANTIGUO_TESTAMENTO),
  "Daniel": TypeBibleBook(
      name: "Daniel", chapters: 12, testament: Testament.ANTIGUO_TESTAMENTO),
  "Oseas": TypeBibleBook(
      name: "Oseas", chapters: 14, testament: Testament.ANTIGUO_TESTAMENTO),
  "Joel": TypeBibleBook(
      name: "Joel", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  "Amos": TypeBibleBook(
      name: "Amos", chapters: 9, testament: Testament.ANTIGUO_TESTAMENTO),
  "Abdias": TypeBibleBook(
      name: "Abdias", chapters: 1, testament: Testament.ANTIGUO_TESTAMENTO),
  "Jonas": TypeBibleBook(
      name: "Jonas", chapters: 4, testament: Testament.ANTIGUO_TESTAMENTO),
  "Miqueas": TypeBibleBook(
      name: "Miqueas", chapters: 7, testament: Testament.ANTIGUO_TESTAMENTO),
  "Nahum": TypeBibleBook(
      name: "Nahum", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  "Habacuc": TypeBibleBook(
      name: "Habacuc", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  "Sofonias": TypeBibleBook(
      name: "Sofonias", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  "Hageo": TypeBibleBook(
      name: "Hageo", chapters: 2, testament: Testament.ANTIGUO_TESTAMENTO),
  "Zacarias": TypeBibleBook(
      name: "Zacarias", chapters: 14, testament: Testament.ANTIGUO_TESTAMENTO),
  "Malaquias": TypeBibleBook(
      name: "Malaquias", chapters: 4, testament: Testament.ANTIGUO_TESTAMENTO),
  "Mateo": TypeBibleBook(
      name: "Mateo", chapters: 28, testament: Testament.NUEVO_TESTAMENTO),
  "Marcos": TypeBibleBook(
      name: "Marcos", chapters: 16, testament: Testament.NUEVO_TESTAMENTO),
  "Lucas": TypeBibleBook(
      name: "Lucas", chapters: 24, testament: Testament.NUEVO_TESTAMENTO),
  "Juan": TypeBibleBook(
      name: "Juan", chapters: 21, testament: Testament.NUEVO_TESTAMENTO),
  "Hechos": TypeBibleBook(
      name: "Hechos", chapters: 28, testament: Testament.NUEVO_TESTAMENTO),
  "Romanos": TypeBibleBook(
      name: "Romanos", chapters: 16, testament: Testament.NUEVO_TESTAMENTO),
  "1-Corintios": TypeBibleBook(
      name: "1-Corintios", chapters: 16, testament: Testament.NUEVO_TESTAMENTO),
  "2-Corintios": TypeBibleBook(
      name: "2-Corintios", chapters: 13, testament: Testament.NUEVO_TESTAMENTO),
  "Galatas": TypeBibleBook(
      name: "Galatas", chapters: 6, testament: Testament.NUEVO_TESTAMENTO),
  "Efesios": TypeBibleBook(
      name: "Efesios", chapters: 6, testament: Testament.NUEVO_TESTAMENTO),
  "Filipenses": TypeBibleBook(
      name: "Filipenses", chapters: 4, testament: Testament.NUEVO_TESTAMENTO),
  "Colosenses": TypeBibleBook(
      name: "Colosenses", chapters: 4, testament: Testament.NUEVO_TESTAMENTO),
  "1-Tesalonicenses": TypeBibleBook(
      name: "1-Tesalonicenses",
      chapters: 5,
      testament: Testament.NUEVO_TESTAMENTO),
  "2-Tesalonicenses": TypeBibleBook(
      name: "2-Tesalonicenses",
      chapters: 3,
      testament: Testament.NUEVO_TESTAMENTO),
  "1-Timoteo": TypeBibleBook(
      name: "1-Timoteo", chapters: 6, testament: Testament.NUEVO_TESTAMENTO),
  "2-Timoteo": TypeBibleBook(
      name: "2-Timoteo", chapters: 4, testament: Testament.NUEVO_TESTAMENTO),
  "Tito": TypeBibleBook(
      name: "Tito", chapters: 3, testament: Testament.NUEVO_TESTAMENTO),
  "Filemon": TypeBibleBook(
      name: "Filemon", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  "Hebreos": TypeBibleBook(
      name: "Hebreos", chapters: 13, testament: Testament.NUEVO_TESTAMENTO),
  "Santiago": TypeBibleBook(
      name: "Santiago", chapters: 5, testament: Testament.NUEVO_TESTAMENTO),
  "1-Pedro": TypeBibleBook(
      name: "1-Pedro", chapters: 5, testament: Testament.NUEVO_TESTAMENTO),
  "2-Pedro": TypeBibleBook(
      name: "2-Pedro", chapters: 3, testament: Testament.NUEVO_TESTAMENTO),
  "1-Juan": TypeBibleBook(
      name: "1-Juan", chapters: 5, testament: Testament.NUEVO_TESTAMENTO),
  "2-Juan": TypeBibleBook(
      name: "2-Juan", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  "3-Juan": TypeBibleBook(
      name: "3-Juan", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  "Judas": TypeBibleBook(
      name: "Judas", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  "Apocalipsis": TypeBibleBook(
      name: "Apocalipsis", chapters: 22, testament: Testament.NUEVO_TESTAMENTO)
};

final bibleBooks = bibleBooksMap.values.toList();
