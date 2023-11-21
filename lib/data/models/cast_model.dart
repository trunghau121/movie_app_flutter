import 'package:movie_app_flutter/domain/entities/cast_entity.dart';

class CastModel extends CastEntity {
  bool? adult;
  int? gender;
  int id;
  String? knownForDepartment;
  String name;
  String? originalName;
  double? popularity;
  String profilePath;
  int? castId;
  String character;
  String? creditId;
  int? order;

  CastModel({
    this.adult,
    this.gender,
    required this.id,
    this.knownForDepartment,
    required this.name,
    this.originalName,
    this.popularity,
    required this.profilePath,
    this.castId,
    required this.character,
    this.creditId,
    this.order,
  }) : super(
          id: id,
          name: name,
          character: character,
          profilePath: profilePath,
        );

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path']?? "",
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['cast_id'] = castId;
    data['character'] = character;
    data['credit_id'] = creditId;
    data['order'] = order;
    return data;
  }
}
