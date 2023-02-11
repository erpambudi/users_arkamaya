import 'package:get_it/get_it.dart';
import 'package:users_arkamaya/domain/usecases/add_user.dart';
import 'package:users_arkamaya/domain/usecases/get_user_detail.dart';
import 'package:users_arkamaya/domain/usecases/get_users.dart';

import 'data/remotes/user_remote.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'presentation/bloc/manage_user_bloc.dart';
import 'presentation/bloc/user_detail_bloc.dart';
import 'presentation/bloc/users_bloc.dart';

final locator = GetIt.instance;

void init() {
  // BloC
  locator.registerLazySingleton<UsersBloc>(() => UsersBloc(locator()));
  locator
      .registerLazySingleton<UserDetailBloc>(() => UserDetailBloc(locator()));
  locator
      .registerLazySingleton<ManageUserBloc>(() => ManageUserBloc(locator()));

  // Datasources
  locator.registerLazySingleton<UserRemote>(() => UserRemoteImpl());

  // Repository
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemote: locator()));

  // Use Case
  locator.registerLazySingleton<GetUsers>(() => GetUsers(locator()));
  locator.registerLazySingleton<GetUserDetail>(() => GetUserDetail(locator()));
  locator.registerLazySingleton<AddUser>(() => AddUser(locator()));
}
