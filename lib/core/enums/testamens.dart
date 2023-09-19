class Testament {
  final String url;
  final String name;

  const Testament({required this.url, required this.name});

  static Testament fromJson(Map<String, dynamic> json) {
    return Testament(
      url: json['url'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'name': name,
    };
  }
}

const testaments = <Testament>[
  Testament(
    url: 'old',
    name: 'Antiguo Testamento',
  ),
  Testament(
    url: 'new',
    name: 'Nuevo Testamento',
  ),
  Testament(
    url: 'both',
    name: 'Antiguo y Nuevo Testamento',
  )
];
