class SideIcon {
  String title;
  int id;
  String asset;

  SideIcon({
    required this.title,
    required this.id,
    required this.asset,
  });

  factory SideIcon.fromJson(Map<String, dynamic> json) {
    return SideIcon(
      id: json['id'],
      asset: json['asset'],
      title: json['title'],
    );
  }
}
