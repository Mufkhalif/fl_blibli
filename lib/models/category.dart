class Category {
  String title;
  int id;
  String asset;

  Category({
    required this.title,
    required this.id,
    required this.asset,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      asset: json['asset'],
      title: json['title'],
    );
  }
}
