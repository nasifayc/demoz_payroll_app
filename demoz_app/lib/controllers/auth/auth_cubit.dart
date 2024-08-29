import 'dart:developer';

import 'package:demoz_app/controllers/auth/auth_state.dart';
import 'package:demoz_app/core/login_manager.dart';
import 'package:demoz_app/models/company_model.dart';
import 'package:demoz_app/services/authentication/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthServices authServices = AuthServices();
  AuthCubit({required this.authServices}) : super(AuthInitial());

  void signIn(String email, String password) async {
    emit(Authenticating());
    try {
      User? user =
          await authServices.signinWithEmailAndPassword(email, password);
      if (user != null) {
        CompanyModel? company = await authServices.getUser(user.uid);
        if (company != null) {
          await LoginManager.saveUser(user.uid);
          emit(Authenticated(company: company));
        } else {
          emit(AuthFailure(message: "Unknown error occured"));
        }
      } else {
        emit(AuthFailure(message: "Invalid email or password"));
      }
    } catch (e) {
      log(e.toString());
      emit(AuthFailure(message: e.toString()));
    }
  }

  void signUp(String email, String password) async {
    emit(Authenticating());
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

    // Validate email format
    if (!emailRegex.hasMatch(email)) {
      emit(AuthFailure(message: 'Invalid email format.'));
      return;
    }

    // Validate password (Minimum 8 characters, at least one letter and one number)
    if (!passwordRegex.hasMatch(password)) {
      emit(AuthFailure(
          message:
              'Password must be at least 8 characters long and contain both letters and numbers.'));
      return;
    }
    try {
      User? user =
          await authServices.signupWithEmailAndPassword(email, password);
      if (user != null) {
        signIn(email, password);
      } else {
        emit(AuthFailure(message: "Unknown error occured"));
      }
    } catch (e) {
      log(e.toString());
      emit(AuthFailure(message: e.toString()));
    }
  }

  // Google Authentication
  void signInWithGoogle() async {
    emit(AuthenticatingGoogle());
    try {
      User? user = await authServices.signinWithGoogle();
      if (user != null) {
        CompanyModel? company = await authServices.getUser(user.uid);
        if (company != null) {
          emit(Authenticated(company: company));
        } else {
          emit(AuthFailure(message: company.toString()));
        }
      }
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  void updateUser(CompanyModel company) async {
    try {
      CompanyModel? companyModel = await authServices.updateUser(company);
      String? currentUserId = await LoginManager.getUser();
      if (companyModel != null && companyModel.id == currentUserId) {
        emit(Authenticated(company: companyModel));
      }
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  void signOut() async {
    emit(Authenticating());
    try {
      await authServices.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  void emitAuthenticated(CompanyModel company) {
    emit(Authenticated(company: company));
  }

  void emitUnauthenticated(String error) {
    emit(AuthFailure(message: error));
  }
}
