import 'package:freezed_annotation/freezed_annotation.dart';

class CastEntity {
  final bool? adult;
  final int? gender;
  final int? id;
  @JsonKey(name: "known_for_department")
  final String? knownForDepartment;
  final String? name;
  @JsonKey(name: "original_name")
  final String? originalName;
  final  double? popularity;
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @JsonKey(name: "cast_id")
  final  int? castId;
  final String? character;
  @JsonKey(name: "credit_id")
  final String? creditId;
  final  int? order;

  const CastEntity({this.adult, this.gender, this.id, this.knownForDepartment, this.name, this.originalName, this.popularity, this.profilePath, this.castId, this.character, this.creditId, this.order});
}