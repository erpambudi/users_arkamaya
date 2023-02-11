part of 'manage_user_bloc.dart';

abstract class ManageUserEvent extends Equatable {
  const ManageUserEvent();

  @override
  List<Object> get props => [];
}

class AddUserEvent extends ManageUserEvent {
  final String name;
  final String job;

  const AddUserEvent(this.name, this.job);

  @override
  List<Object> get props => [name, job];
}
