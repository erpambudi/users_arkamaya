import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  const UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];
}

class NewUser extends Equatable {
  const NewUser({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  final String name;
  final String job;
  final String id;
  final DateTime createdAt;

  @override
  List<Object?> get props => [name, job, id, createdAt];
}
