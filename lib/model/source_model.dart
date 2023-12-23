class SourceModel {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  SourceModel(
      {required this.id, required this.country, required this.name, required this.description, required this.category, required this.language, required this.url});
}