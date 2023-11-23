import '../../domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  String? iso6391;
  String? iso31661;
  @override
  String name;
  @override
  String key;
  String? site;
  int? size;
  @override
  String type;
  bool? official;
  String? publishedAt;
  String? id;

  VideoModel(
      {this.iso6391,
      this.iso31661,
      required this.name,
      required this.key,
      this.site,
      this.size,
      required this.type,
      this.official,
      this.publishedAt,
      this.id})
      : super(
          key: key,
          name: name,
          type: type,
        );

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_639_1'] = iso6391;
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    data['key'] = key;
    data['site'] = site;
    data['size'] = size;
    data['type'] = type;
    data['official'] = official;
    data['published_at'] = publishedAt;
    data['id'] = id;
    return data;
  }
}
