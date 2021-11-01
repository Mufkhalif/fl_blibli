class SideIcon {
  String title;
  int id;
  String asset;
  String bannerUrl;

  SideIcon({
    required this.title,
    required this.id,
    required this.asset,
    required this.bannerUrl,
  });

  factory SideIcon.fromJson(Map<String, dynamic> json) {
    return SideIcon(
      id: json['id'],
      asset: json['asset'],
      title: json['title'],
      bannerUrl: json['bannerUrl'],
    );
  }
}
