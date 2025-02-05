import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/auth/domain/usecase/login_usecase.dart';
import 'package:insta_clone/auth/domain/usecase/signUp_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUsecase signupUsecase;
  final LoginUsecase loginUsecase;

  AuthBloc({
    required this.signupUsecase,
    required this.loginUsecase,
  }) : super(AuthInitialState()) {
    on<UserSignUpRequestedEvent>(onUserSignUpRequestedEvent);

    on<UserLogInRequestedEvent>(onUserLogInRequestedEvent);
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

  //
  void onUserLogInRequestedEvent(
      UserLogInRequestedEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final res = await loginUsecase.call(
        LoginUserParams(
          email: event.email,
          password: event.password,
        ),
      );

      res.fold(
        (l) => emit(AuthFailure(errorMessage: l.message)),
        (r) => emit(AuthSuccess(userID: r)),
      );
    } catch (err) {
      emit(AuthFailure(errorMessage: err.toString()));
    }
  }
}
