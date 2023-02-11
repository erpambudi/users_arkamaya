import 'package:dartz/dartz.dart';
import 'package:users_arkamaya/core/network/failure.dart';
import 'package:users_arkamaya/domain/entities/user_data.dart';
import 'package:users_arkamaya/domain/repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<Either<Failure, List<UserData>>> execute() {
    return repository.getUsers();
  }
}
