class BibleVersion {
  final String url;
  final String name;

  const BibleVersion({required this.url, required this.name});
}

const versionsList = <BibleVersion>[
  BibleVersion(
    url: 'rv1960',
    name: 'Reina Valera 1960',
  ),
  BibleVersion(
    url: 'rv1995',
    name: 'Reina Valera 1995',
  ),
  BibleVersion(
    url: 'nvi',
    name: 'Nueva Versión Internacional',
  ),
  BibleVersion(
    url: 'dhh',
    name: 'Dios Habla Hoy',
  ),
];
