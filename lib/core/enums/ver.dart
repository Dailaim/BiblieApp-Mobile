class BibleVer {
  String verse;
  String? study;
  int number;
  int id;

  BibleVer({
    required this.verse,
    this.study,
    required this.number,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'verse': verse,
      'study': study,
      'number': number,
      'id': id,
    };
  }

  static BibleVer fromJson(Map<String, dynamic> json) {
    return BibleVer(
      verse: json['verse'],
      study: json['study'],
      number: json['number'],
      id: json['id'],
    );
  }
}
