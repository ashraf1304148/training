class VideoModel {
  String? id, title, time, thumbnail, videoUrl;
  VideoModel({
    this.id,
    this.title,
    this.time,
    this.thumbnail,
    this.videoUrl,
  });

  VideoModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.time = json["time"];
    this.thumbnail = json["thumbnail"];
    this.videoUrl = json["videoUrl"];
  }

  Map<String, dynamic> jsontoJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["id"] = this.id!;
    json["title"] = this.title!;
    json["time"] = this.time!;
    json["thumbnail"] = this.thumbnail!;
    json["videoUrl"] = this.videoUrl!;
    return json;
  }
}
