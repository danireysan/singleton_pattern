part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool userExists;
  final Usuario? user;

  const UserState({this.userExists = false, this.user});
}

class UserInitialState extends UserState {
  const UserInitialState() : super(userExists: false, user: null);
}

class UserLoadedState extends UserState {
  const UserLoadedState(Usuario user) : super(userExists: true, user: user);
}
