class AllUserInfoModel {
    final int? postId;
    final int? id;
    final String? name;
    final String? email;
    final String? body;

    AllUserInfoModel({
        this.postId,
        this.id,
        this.name,
        this.email,
        this.body,
    });

    factory AllUserInfoModel.fromJson(Map<String, dynamic> json) => AllUserInfoModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
