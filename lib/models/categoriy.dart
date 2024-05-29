import 'package:json_annotation/json_annotation.dart';

part 'categoriy.g.dart';

@JsonSerializable()
class Categoriy {
  final int id;
  final String name;
  final String image;
  final String creationAt;
  final String updatedAt;

  const Categoriy({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Categoriy.fromJson(Map<String, dynamic> json) {
    return _$CategoriyFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriyToJson(this);
  }
}
