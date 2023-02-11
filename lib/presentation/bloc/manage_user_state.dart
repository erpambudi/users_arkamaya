part of 'manage_user_bloc.dart';

abstract class ManageUserState extends Equatable {
  const ManageUserState();

  @override
  List<Object> get props => [];
}

class ManageUserInitial extends ManageUserState {}

class ManageUserLoading extends ManageUserState {}

class ManageUserSuccess extends ManageUserState {
  final NewUser newUser;

  const ManageUserSuccess(this.newUser);

  @override
  List<Object> get props => [newUser];
}

class ManageUserError extends ManageUserState {
  final String message;

  const ManageUserError(this.message);

  @override
  List<Object> get props => [message];
}
