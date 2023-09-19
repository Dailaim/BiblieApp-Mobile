import 'package:flutterpractic/core/enums/chapter.dart';

class BibleBook {
  final String name;
  final int chapters;
  final Testament _testament;
  Map<int, BibleChapter?> chaptersMap = {};

  String get testament => _testament == Testament.ANTIGUO_TESTAMENTO
      ? 'Antiguo Testamento'
      : 'Nuevo Testamento';

  Testament get testamentType => _testament;

  BibleBook({
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

  BibleBook.fromJson(Map<String, dynamic> json)
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

Map<String, BibleBook> bibleBooksMap = {
  "Genesis": BibleBook(
      name: "Genesis", chapters: 50, testament: Testament.ANTIGUO_TESTAMENTO),
  "Exodo": BibleBook(
      name: "Exodo", chapters: 40, testament: Testament.ANTIGUO_TESTAMENTO),
  "Levitico": BibleBook(
      name: "Levitico", chapters: 27, testament: Testament.ANTIGUO_TESTAMENTO),
  "Numeros": BibleBook(
      name: "Numeros", chapters: 36, testament: Testament.ANTIGUO_TESTAMENTO),
  "Deuteronomio": BibleBook(
      name: "Deuteronomio",
      chapters: 34,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "Josue": BibleBook(
      name: "Josue", chapters: 24, testament: Testament.ANTIGUO_TESTAMENTO),
  "Jueces": BibleBook(
      name: "Jueces", chapters: 21, testament: Testament.ANTIGUO_TESTAMENTO),
  "Rut": BibleBook(
      name: "Rut", chapters: 4, testament: Testament.ANTIGUO_TESTAMENTO),
  "1-Samuel": BibleBook(
      name: "1-Samuel", chapters: 31, testament: Testament.ANTIGUO_TESTAMENTO),
  "2-Samuel": BibleBook(
      name: "2-Samuel", chapters: 24, testament: Testament.ANTIGUO_TESTAMENTO),
  "1-Reyes": BibleBook(
      name: "1-Reyes", chapters: 22, testament: Testament.ANTIGUO_TESTAMENTO),
  "2-Reyes": BibleBook(
      name: "2-Reyes", chapters: 25, testament: Testament.ANTIGUO_TESTAMENTO),
  "1-Cronicas": BibleBook(
      name: "1-Cronicas",
      chapters: 29,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "2-Cronicas": BibleBook(
      name: "2-Cronicas",
      chapters: 36,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "Esdras": BibleBook(
      name: "Esdras", chapters: 10, testament: Testament.ANTIGUO_TESTAMENTO),
  "Nehemias": BibleBook(
      name: "Nehemias", chapters: 13, testament: Testament.ANTIGUO_TESTAMENTO),
  "Ester": BibleBook(
      name: "Ester", chapters: 10, testament: Testament.ANTIGUO_TESTAMENTO),
  "Job": BibleBook(
      name: "Job", chapters: 42, testament: Testament.ANTIGUO_TESTAMENTO),
  "Salmos": BibleBook(
      name: "Salmos", chapters: 150, testament: Testament.ANTIGUO_TESTAMENTO),
  "Proverbios": BibleBook(
      name: "Proverbios",
      chapters: 31,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "Eclesiastes": BibleBook(
      name: "Eclesiastes",
      chapters: 12,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "Cantares": BibleBook(
      name: "Cantares", chapters: 8, testament: Testament.ANTIGUO_TESTAMENTO),
  "Isaias": BibleBook(
      name: "Isaias", chapters: 66, testament: Testament.ANTIGUO_TESTAMENTO),
  "Jeremias": BibleBook(
      name: "Jeremias", chapters: 52, testament: Testament.ANTIGUO_TESTAMENTO),
  "Lamentaciones": BibleBook(
      name: "Lamentaciones",
      chapters: 5,
      testament: Testament.ANTIGUO_TESTAMENTO),
  "Ezequiel": BibleBook(
      name: "Ezequiel", chapters: 48, testament: Testament.ANTIGUO_TESTAMENTO),
  "Daniel": BibleBook(
      name: "Daniel", chapters: 12, testament: Testament.ANTIGUO_TESTAMENTO),
  "Oseas": BibleBook(
      name: "Oseas", chapters: 14, testament: Testament.ANTIGUO_TESTAMENTO),
  "Joel": BibleBook(
      name: "Joel", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  "Amos": BibleBook(
      name: "Amos", chapters: 9, testament: Testament.ANTIGUO_TESTAMENTO),
  "Abdias": BibleBook(
      name: "Abdias", chapters: 1, testament: Testament.ANTIGUO_TESTAMENTO),
  "Jonas": BibleBook(
      name: "Jonas", chapters: 4, testament: Testament.ANTIGUO_TESTAMENTO),
  "Miqueas": BibleBook(
      name: "Miqueas", chapters: 7, testament: Testament.ANTIGUO_TESTAMENTO),
  "Nahum": BibleBook(
      name: "Nahum", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  "Habacuc": BibleBook(
      name: "Habacuc", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  "Sofonias": BibleBook(
      name: "Sofonias", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  "Hageo": BibleBook(
      name: "Hageo", chapters: 2, testament: Testament.ANTIGUO_TESTAMENTO),
  "Zacarias": BibleBook(
      name: "Zacarias", chapters: 14, testament: Testament.ANTIGUO_TESTAMENTO),
  "Malaquias": BibleBook(
      name: "Malaquias", chapters: 4, testament: Testament.ANTIGUO_TESTAMENTO),
  "Mateo": BibleBook(
      name: "Mateo", chapters: 28, testament: Testament.NUEVO_TESTAMENTO),
  "Marcos": BibleBook(
      name: "Marcos", chapters: 16, testament: Testament.NUEVO_TESTAMENTO),
  "Lucas": BibleBook(
      name: "Lucas", chapters: 24, testament: Testament.NUEVO_TESTAMENTO),
  "Juan": BibleBook(
      name: "Juan", chapters: 21, testament: Testament.NUEVO_TESTAMENTO),
  "Hechos": BibleBook(
      name: "Hechos", chapters: 28, testament: Testament.NUEVO_TESTAMENTO),
  "Romanos": BibleBook(
      name: "Romanos", chapters: 16, testament: Testament.NUEVO_TESTAMENTO),
  "1-Corintios": BibleBook(
      name: "1-Corintios", chapters: 16, testament: Testament.NUEVO_TESTAMENTO),
  "2-Corintios": BibleBook(
      name: "2-Corintios", chapters: 13, testament: Testament.NUEVO_TESTAMENTO),
  "Galatas": BibleBook(
      name: "Galatas", chapters: 6, testament: Testament.NUEVO_TESTAMENTO),
  "Efesios": BibleBook(
      name: "Efesios", chapters: 6, testament: Testament.NUEVO_TESTAMENTO),
  "Filipenses": BibleBook(
      name: "Filipenses", chapters: 4, testament: Testament.NUEVO_TESTAMENTO),
  "Colosenses": BibleBook(
      name: "Colosenses", chapters: 4, testament: Testament.NUEVO_TESTAMENTO),
  "1-Tesalonicenses": BibleBook(
      name: "1-Tesalonicenses",
      chapters: 5,
      testament: Testament.NUEVO_TESTAMENTO),
  "2-Tesalonicenses": BibleBook(
      name: "2-Tesalonicenses",
      chapters: 3,
      testament: Testament.NUEVO_TESTAMENTO),
  "1-Timoteo": BibleBook(
      name: "1-Timoteo", chapters: 6, testament: Testament.NUEVO_TESTAMENTO),
  "2-Timoteo": BibleBook(
      name: "2-Timoteo", chapters: 4, testament: Testament.NUEVO_TESTAMENTO),
  "Tito": BibleBook(
      name: "Tito", chapters: 3, testament: Testament.NUEVO_TESTAMENTO),
  "Filemon": BibleBook(
      name: "Filemon", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  "Hebreos": BibleBook(
      name: "Hebreos", chapters: 13, testament: Testament.NUEVO_TESTAMENTO),
  "Santiago": BibleBook(
      name: "Santiago", chapters: 5, testament: Testament.NUEVO_TESTAMENTO),
  "1-Pedro": BibleBook(
      name: "1-Pedro", chapters: 5, testament: Testament.NUEVO_TESTAMENTO),
  "2-Pedro": BibleBook(
      name: "2-Pedro", chapters: 3, testament: Testament.NUEVO_TESTAMENTO),
  "1-Juan": BibleBook(
      name: "1-Juan", chapters: 5, testament: Testament.NUEVO_TESTAMENTO),
  "2-Juan": BibleBook(
      name: "2-Juan", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  "3-Juan": BibleBook(
      name: "3-Juan", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  "Judas": BibleBook(
      name: "Judas", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  "Apocalipsis": BibleBook(
      name: "Apocalipsis", chapters: 22, testament: Testament.NUEVO_TESTAMENTO)
};

final bibleBooks = bibleBooksMap.values.toList();
