import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:users_arkamaya/domain/entities/user_data.dart';
import 'package:users_arkamaya/domain/usecases/get_users.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsers _getUsers;

  UsersBloc(this._getUsers) : super(UsersInitial()) {
    on<GetUsersEvent>((event, emit) async {
      emit(UsersLoading());

      final result = await _getUsers.execute();

      result.fold((failure) {
        emit(UsersError(failure.message));
      }, (data) {
        emit(UsersHasData(data));
      });
    });
  }
}
