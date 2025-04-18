class BlogModel {
  String? id;
  String? title;
  String? content;
  String? img;
  String? createdAt;

  BlogModel({
    this.id,
    this.title,
    this.content,
    this.createdAt,
  });

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['post'];
    img = json['img'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['post'] = content;
    data['img'] = img;
    data['created_at'] = createdAt;
    return data;
  }
}
