import 'package:flutterpractic/core/enums/ver.dart';

class BibleChapter {
  final int number;
  final List<BibleVer> verses;

  BibleChapter({required this.number, required this.verses});

  static BibleChapter fromJson(Map<String, dynamic> json) {
    return BibleChapter(
      number: json['number'],
      verses: json['verses']
          .map<BibleVer>((v) => BibleVer.fromJson(v))
          .toList(growable: false),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'verses': verses.map((v) => v.toJson()).toList(growable: false),
    };
  }
}
