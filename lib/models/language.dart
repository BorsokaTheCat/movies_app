
class Language {
  final String iso6391;
  final String englishName;
  final String name;

  Language({
    required this.iso6391,
    required this.englishName,
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      iso6391: json['iso_639_1'],
      englishName: json['english_name'],
      name: json['name'],
    );
  }
}