import 'package:flutterpractic/core/enums/books.dart';

class TypeBibleVersion {
  final String url;
  final String name;
  final String? short;

  Map<String, TypeBibleBook> booksMaps = bibleBooksMap;

  TypeBibleVersion({required this.url, required this.name, this.short});

  TypeBibleVersion.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        name = json['name'],
        short = json['short'],
        booksMaps = (json['booksMaps'] as Map<String, dynamic>)
            .map<String, TypeBibleBook>(
                (k, v) => MapEntry(k, TypeBibleBook.fromJson(v)))
            .cast<String, TypeBibleBook>();

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
    return TypeBibleVersion(
      url: url ?? this.url,
      name: name ?? this.name,
      short: short ?? this.short,
    );
  }
}

final bibleVersionMap = {
  'rv1960': TypeBibleVersion(
    url: 'rv1960',
    name: 'Reina Valera 1960',
  ),
  'rv1995': TypeBibleVersion(
    url: 'rv1995',
    name: 'Reina Valera 1995',
  ),
  'nvi': TypeBibleVersion(
    url: 'nvi',
    short: 'Internacional',
    name: 'Nueva Versión Internacional',
  ),
  'dhh': TypeBibleVersion(
    url: 'dhh',
    name: 'Dios Habla Hoy',
  ),
};

final versionsList = bibleVersionMap.values.toList(growable: false);
