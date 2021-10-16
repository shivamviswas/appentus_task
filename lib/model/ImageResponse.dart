
class ImagesResponse {
  ImagesResponse({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  factory ImagesResponse.fromJson(Map<String, dynamic> json) => ImagesResponse(
    id: json["id"],
    author: json["author"],
    width: json["width"],
    height: json["height"],
    url: json["url"],
    downloadUrl: json["download_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author": author,
    "width": width,
    "height": height,
    "url": url,
    "download_url": downloadUrl,
  };
}
