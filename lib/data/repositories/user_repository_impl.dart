import 'package:users_arkamaya/core/network/exceptions/base_exception.dart';
import 'package:users_arkamaya/data/remotes/user_remote.dart';
import 'package:users_arkamaya/domain/entities/user_data.dart';
import 'package:users_arkamaya/core/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:users_arkamaya/domain/entities/user_detail.dart';
import 'package:users_arkamaya/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemote userRemote;

  UserRepositoryImpl({required this.userRemote});

  @override
  Future<Either<Failure, List<UserData>>> getUsers() async {
    try {
      final result = await userRemote.getUsers();
      return Right(result.map((e) => e.toEntity()).toList());
    } on BaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserDetail>> getDetailUsers(int id) async {
    try {
      final result = await userRemote.getDetailUsers(id);
      return Right(result.toEntity());
    } on BaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, NewUser>> addUser(String name, String job) async {
    try {
      final result = await userRemote.addUser(name, job);
      return Right(result.toEntity());
    } on BaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
