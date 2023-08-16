
class AllUserFotoModel {
    final int? albumId;
    final int? id;
    final String? title;
    final String? url;
    final String? thumbnailUrl;

    AllUserFotoModel({
        this.albumId,
        this.id,
        this.title,
        this.url,
        this.thumbnailUrl,
    });

    factory AllUserFotoModel.fromJson(Map<String, dynamic> json) => AllUserFotoModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
