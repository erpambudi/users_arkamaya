import 'package:dartz/dartz.dart';
import 'package:users_arkamaya/core/network/failure.dart';
import 'package:users_arkamaya/domain/entities/user_detail.dart';
import 'package:users_arkamaya/domain/repositories/user_repository.dart';

class GetUserDetail {
  final UserRepository repository;

  GetUserDetail(this.repository);

  Future<Either<Failure, UserDetail>> execute(int id) {
    return repository.getDetailUsers(id);
  }
}
