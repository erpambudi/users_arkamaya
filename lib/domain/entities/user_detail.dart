import 'package:equatable/equatable.dart';
import 'package:users_arkamaya/domain/entities/user_data.dart';

class UserDetail {
  UserDetail({
    required this.data,
    required this.support,
  });

  UserData data;
  Support support;
}

class Support extends Equatable {
  const Support({
    required this.url,
    required this.text,
  });

  final String url;
  final String text;

  @override
  List<Object?> get props => [url, text];
}
