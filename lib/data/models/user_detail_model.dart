import 'package:users_arkamaya/data/models/user_model.dart';
import 'package:users_arkamaya/domain/entities/user_detail.dart';

class UserDetailModel {
  UserDetailModel({
    required this.data,
    required this.support,
  });

  UserDataModel data;
  SupportModel support;

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      UserDetailModel(
        data: UserDataModel.fromJson(json["data"]),
        support: SupportModel.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "support": support.toJson(),
      };

  UserDetail toEntity() => UserDetail(
        data: data.toEntity(),
        support: support.toEntity(),
      );
}

class SupportModel {
  SupportModel({
    required this.url,
    required this.text,
  });

  String url;
  String text;

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };

  Support toEntity() => Support(
        url: url,
        text: text,
      );
}
