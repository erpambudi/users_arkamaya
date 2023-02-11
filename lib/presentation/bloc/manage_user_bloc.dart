import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:users_arkamaya/domain/entities/user_data.dart';
import 'package:users_arkamaya/domain/usecases/add_user.dart';

part 'manage_user_event.dart';
part 'manage_user_state.dart';

class ManageUserBloc extends Bloc<ManageUserEvent, ManageUserState> {
  final AddUser _addUser;

  ManageUserBloc(this._addUser) : super(ManageUserInitial()) {
    on<AddUserEvent>((event, emit) async {
      emit(ManageUserLoading());

      final result = await _addUser.execute(event.name, event.job);

      result.fold((failure) {
        emit(ManageUserError(failure.message));
      }, (data) {
        emit(ManageUserSuccess(data));
      });
    });
  }
}
