class ArticleModel {
  final String? image;
  final String? text;

  ArticleModel({required this.image, required this.text});

  factory ArticleModel.fromMap(Map<String, dynamic> json) =>
      ArticleModel(image: json['image'], text: json['text']);

  Map<String, dynamic> toMap() => {
        "image": image,
        "text": text,
      };
}
