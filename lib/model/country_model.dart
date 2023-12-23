class Countrymodel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishdAt;
  String content;

  Countrymodel(
      {required this.description,
      required this.url,
      required this.title,
      required this.author,
      required this.content,
      required this.publishdAt,
      required this.urlToImage});
}
