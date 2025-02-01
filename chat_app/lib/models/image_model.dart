
import 'package:json_annotation/json_annotation.dart';
///Place name of file you are generating
///code for. "g" means generated file. Which
///will be a part of this file.
///
/// To generate this code you run in the terminal
/// the command "flutter pub run build_runner build"
/// or "dart run build_runner build".
///
/// Following you will see a "image_model.g.dart"
/// file be created in the same directory as
/// "image_model.dart".
part 'image_model.g.dart';

/// "@JsonSerializable()" lets Dart know that
/// this is the class we want generated code for.
@JsonSerializable()
class GirlImage {
  String description;
  ///This is required to let Dart know
  ///that our Json variable doesn't
  ///match out Dart camel case format.
  @JsonKey(name: 'image-url')
  String imageUrl;

  /// Curly braces make all of these "named" parameters. Which
  /// means unless specified as "required" they are considered
  /// optional (aka can be null).
  GirlImage({required this.description, required this.imageUrl});

/// Need to create factory constructors to allow for
/// JSON Serialization and Deserialization.
/// (Same idea as in "chat_message_entity".
///
/// This is how we have done it in the past.
  /*
  factory GirlImage.fromJson(Map<String, dynamic> json) {
    return GirlImage(
      description: json['description'],
      imageUrl: json['image-url'],
    );
  }
  */

/// Now we will use the "json_serializable" package.
/// This will prevent us from manually having to Deserialize
/// and Serialize over and over.
  ///
  /// "json_serializable" package has additional dependencies
  /// needed including "json_annotation" and "build_runner"
  ///
  /// Connect the generated [_$GirlImageFromJson] function to the `fromJson`
  /// factory.
  factory GirlImage.fromJson(Map<String, dynamic> json) => _$GirlImageFromJson(json);

  /// Connect the generated [_$GirlImageToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GirlImageToJson(this);

}
