import 'package:flutterpractic/core/enums/books.dart';
import 'package:flutterpractic/core/enums/versions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_context.g.dart';

@Riverpod(keepAlive: true)
class BibleVersion extends _$BibleVersion {
  @override
  TypeBibleVersion build() {
    return versionsList[2];
  }

  void changeVersion(TypeBibleVersion version) {
    state = version;
  }
}

@Riverpod(keepAlive: true)
class BibleChapter extends _$BibleChapter {
  @override
  int? build() {
    return null;
  }

  void changeChapter(int chapter) {
    state = chapter;
  }
}

@Riverpod(keepAlive: true)
class BibleBook extends _$BibleBook {
  @override
  TypeBibleBook? build() {
    return null;
  }

  void changeBook(TypeBibleBook book) {
    state = book;
  }
}
