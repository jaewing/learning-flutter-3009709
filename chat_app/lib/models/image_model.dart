import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class GirlImage {
  String description;
  @JsonKey(name: 'image-url')
  String imageUrl;
  

  GirlImage({required this.description, required this.imageUrl});

  factory GirlImage.fromJson(Map<String, dynamic> json) =>
      _$GirlImageFromJson(json);

  Map<String, dynamic> toJson() => _$GirlImageToJson(this);
}
