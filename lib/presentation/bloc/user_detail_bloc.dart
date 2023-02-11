import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:users_arkamaya/domain/entities/user_detail.dart';
import 'package:users_arkamaya/domain/usecases/get_user_detail.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final GetUserDetail _getUserDetail;

  UserDetailBloc(this._getUserDetail) : super(UserDetailInitial()) {
    on<GetUserDetailEvent>((event, emit) async {
      emit(UserDetailLoading());

      final result = await _getUserDetail.execute(event.id);

      result.fold((failure) {
        emit(UserDetailError(failure.message));
      }, (data) {
        emit(UserDetailHasData(data));
      });
    });
  }
}
