import 'package:bloc/bloc.dart';
import 'package:enviro_car/blocs/authentication/authentication_bloc.dart';
import 'package:enviro_car/blocs/authentication/authentication_event.dart';
import 'package:enviro_car/services/auth/auth_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationServices _authenticationService;

  LoginBloc(AuthenticationBloc authenticationBloc,
      AuthenticationServices authenticationService)
      : assert(authenticationBloc != null),
        assert(authenticationService != null),
        _authenticationBloc = authenticationBloc,
        _authenticationService = authenticationService,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(
      LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();
    try {
      final user =
          await _authenticationService.login(event.username, event.password);
      if (user != null) {
        _authenticationBloc.add(UserLoggedIn(user: user));
        yield LoginSuccess();
        yield LoginInitial();
      } else {
        yield LoginFailure(error: 'Something very weird just happened');
      }
    } catch (err) {
      yield LoginFailure(
          error: err.message.toString() ?? 'An unknown error occured');
    }
  }
}
