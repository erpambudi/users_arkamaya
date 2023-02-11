import 'package:dartz/dartz.dart';
import 'package:users_arkamaya/core/network/failure.dart';
import 'package:users_arkamaya/domain/entities/user_data.dart';
import 'package:users_arkamaya/domain/repositories/user_repository.dart';

class AddUser {
  final UserRepository repository;

  AddUser(this.repository);

  Future<Either<Failure, NewUser>> execute(String name, String job) {
    return repository.addUser(name, job);
  }
}
