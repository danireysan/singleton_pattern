part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final Usuario newUser;

  ActivateUser(this.newUser);
}

class ChangeAge extends UserEvent {
  final int newAge;

  ChangeAge(this.newAge);
}

class AddProfession extends UserEvent {
  final String newProfession;

  AddProfession(this.newProfession);
}

class EraseUserEvent extends UserEvent {}
