class BibleBook {
  final String name;
  final int chapters;
  final Testament _testament;

  String get testament => _testament == Testament.ANTIGUO_TESTAMENTO
      ? 'Antiguo Testamento'
      : 'Nuevo Testamento';

  Testament get testamentType => _testament;

  const BibleBook({
    required this.name,
    required this.chapters,
    required Testament testament,
  }) : _testament = testament;
}

enum Testament { ANTIGUO_TESTAMENTO, NUEVO_TESTAMENTO }

const bibleBooks = <BibleBook>[
  BibleBook(
      name: "Genesis", chapters: 50, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Exodo", chapters: 40, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Levitico", chapters: 27, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Numeros", chapters: 36, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Deuteronomio",
      chapters: 34,
      testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Josue", chapters: 24, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Jueces", chapters: 21, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(name: "Rut", chapters: 4, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "1-Samuel", chapters: 31, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "2-Samuel", chapters: 24, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "1-Reyes", chapters: 22, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "2-Reyes", chapters: 25, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "1-Cronicas",
      chapters: 29,
      testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "2-Cronicas",
      chapters: 36,
      testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Esdras", chapters: 10, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Nehemias", chapters: 13, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Ester", chapters: 10, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(name: "Job", chapters: 42, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Salmos", chapters: 150, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Proverbios",
      chapters: 31,
      testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Eclesiastes",
      chapters: 12,
      testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Cantares", chapters: 8, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Isaias", chapters: 66, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Jeremias", chapters: 52, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Lamentaciones",
      chapters: 5,
      testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Ezequiel", chapters: 48, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Daniel", chapters: 12, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Oseas", chapters: 14, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(name: "Joel", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(name: "Amos", chapters: 9, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Abdias", chapters: 1, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Jonas", chapters: 4, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Miqueas", chapters: 7, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Nahum", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Habacuc", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Sofonias", chapters: 3, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Hageo", chapters: 2, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Zacarias", chapters: 14, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(
      name: "Malaquias", chapters: 4, testament: Testament.ANTIGUO_TESTAMENTO),
  BibleBook(name: "Mateo", chapters: 28, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "Marcos", chapters: 16, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(name: "Lucas", chapters: 24, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(name: "Juan", chapters: 21, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "Hechos", chapters: 28, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "Romanos", chapters: 16, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "1-Corintios", chapters: 16, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "2-Corintios", chapters: 13, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "Galatas", chapters: 6, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "Efesios", chapters: 6, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "Filipenses", chapters: 4, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "Colosenses", chapters: 4, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "1-Tesalonicenses",
      chapters: 5,
      testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "2-Tesalonicenses",
      chapters: 3,
      testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "1-Timoteo", chapters: 6, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "2-Timoteo", chapters: 4, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(name: "Tito", chapters: 3, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "Filemon", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "Hebreos", chapters: 13, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "Santiago", chapters: 5, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "1-Pedro", chapters: 5, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "2-Pedro", chapters: 3, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(name: "1-Juan", chapters: 5, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(name: "2-Juan", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(name: "3-Juan", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(name: "Judas", chapters: 1, testament: Testament.NUEVO_TESTAMENTO),
  BibleBook(
      name: "Apocalipsis", chapters: 22, testament: Testament.NUEVO_TESTAMENTO)
];
