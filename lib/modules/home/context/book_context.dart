import 'package:flutterpractic/core/enums/books.dart' as bibleBookBase
    show bibleBooksMap, BibleBook;
import 'package:flutterpractic/core/enums/versions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BibleContext {
  BibleVersion? version;
  bibleBookBase.BibleBook? book;
  int? chapter;

  BibleContext({
    this.version,
    this.book,
    this.chapter,
  });

  BibleContext copyWith({
    BibleVersion? version,
    bibleBookBase.BibleBook? book,
    int? chapter,
  }) {
    return BibleContext(
      version: version ?? this.version,
      book: book ?? this.book,
      chapter: chapter ?? this.chapter,
    );
  }
}

final bibleProvider =
    StateProvider((ref) => BibleContext(version: versionsList[2]));
