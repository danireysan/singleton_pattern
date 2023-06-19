import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/usuario.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      emit(UserLoadedState(event.newUser));
    });
    on<ChangeAge>((event, emit) {
      if (state is! UserLoadedState) return;

      final loadedState = state;
      final updatedUser = loadedState.user!.copyWith(edad: event.newAge);
      emit(UserLoadedState(updatedUser));
    });
    on<AddProfession>((event, emit) {
      if (state is! UserLoadedState) return;

      final loadedState = state;
      final updatedUser = loadedState.user!.copyWith(
        profesiones: [
          ...loadedState.user!.profesiones,
          event.newProfession,
        ],
      );
      emit(UserLoadedState(updatedUser));
    });
    on<EraseUserEvent>((event, emit) {
      emit(const UserInitialState());
    });
  }
}
