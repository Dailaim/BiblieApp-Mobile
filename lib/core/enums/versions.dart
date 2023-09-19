import 'package:flutterpractic/core/enums/books.dart';

class BibleVersion {
  final String url;
  final String name;
  final String? short;

  Map<String, BibleBook> booksMaps = bibleBooksMap;

  BibleVersion({required this.url, required this.name, this.short});

  BibleVersion.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        name = json['name'],
        short = json['short'],
        booksMaps = (json['booksMaps'] as Map<String, dynamic>)
            .map<String, BibleBook>(
                (k, v) => MapEntry(k, BibleBook.fromJson(v)))
            .cast<String, BibleBook>();

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'name': name,
      'short': short,
      'booksMaps': booksMaps
          .map<String, dynamic>((k, v) => MapEntry(k, v.toJson()))
          .cast<String, dynamic>(),
    };
  }

  withCopy({
    String? url,
    String? name,
    String? short,
  }) {
    return BibleVersion(
      url: url ?? this.url,
      name: name ?? this.name,
      short: short ?? this.short,
    );
  }
}

final bibleVersionMap = {
  'rv1960': BibleVersion(
    url: 'rv1960',
    name: 'Reina Valera 1960',
  ),
  'rv1995': BibleVersion(
    url: 'rv1995',
    name: 'Reina Valera 1995',
  ),
  'nvi': BibleVersion(
    url: 'nvi',
    short: 'Internacional',
    name: 'Nueva Versión Internacional',
  ),
  'dhh': BibleVersion(
    url: 'dhh',
    name: 'Dios Habla Hoy',
  ),
};

final versionsList = bibleVersionMap.values.toList(growable: false);
