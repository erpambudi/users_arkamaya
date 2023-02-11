import 'package:dartz/dartz.dart';
import 'package:users_arkamaya/core/network/failure.dart';
import 'package:users_arkamaya/domain/entities/user_data.dart';
import 'package:users_arkamaya/domain/entities/user_detail.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserData>>> getUsers();
  Future<Either<Failure, UserDetail>> getDetailUsers(int id);
  Future<Either<Failure, NewUser>> addUser(String name, String job);
}
