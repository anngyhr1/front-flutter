import 'package:json_annotation/json_annotation.dart';

/// This allows the `User
part 'storie_model.g.dart';

/// An annotation for the code generator
@JsonSerializable()
class StorieModel {
  // String uid;
  String title;
  String text;
  String author;
  String image;
  double rate;
  int views;
  String date;
  List<String> categories;

  StorieModel(this.title, this.text, this.author, this.image, this.rate,
      this.views, this.date, this.categories);

  factory StorieModel.fromJson(Map<String, dynamic> json) =>
      _$StorieModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorieModelToJson(this);
}
