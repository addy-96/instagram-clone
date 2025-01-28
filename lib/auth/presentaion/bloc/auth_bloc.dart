import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/auth/domain/usecase/signUp_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUsecase signupUsecase;

  AuthBloc({
    required this.signupUsecase,
  }) : super(AuthInitialState()) {
    on<UserSignUpRequestedEvent>(onUserSignUpRequestedEvent);
  }

//
  void onUserSignUpRequestedEvent(
      UserSignUpRequestedEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final res = await signupUsecase.call(UserSignUpParams(
        email: event.email,
        username: event.username,
        password: event.password,
      ));

      res.fold((l) => emit(AuthFailure(errorMessage: l.message)),
          (r) => emit(AuthSuccess(userID: r)));
    } catch (err) {
      emit(AuthFailure(errorMessage: err.toString()));

    }
  }
}






