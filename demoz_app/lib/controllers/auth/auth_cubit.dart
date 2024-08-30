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

  void signUp(
      String email,
      String password,
      String companyName,
      String address,
      String phoneNumber,
      String tinNumber,
      int numberOfEmployees,
      String companyBank,
      String bankAccount) async {
    emit(Authenticating());

    try {
      User? user = await authServices.signupWithEmailAndPassword(
          email,
          password,
          companyName,
          address,
          phoneNumber,
          tinNumber,
          numberOfEmployees,
          companyBank,
          bankAccount);
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
  void signInWithGoogle(
      String companyName,
      String address,
      String phoneNumber,
      String tinNumber,
      int numberOfEmployees,
      String companyBank,
      String bankAccount) async {
    emit(AuthenticatingGoogle());
    try {
      User? user = await authServices.signinWithGoogle(companyName, address,
          phoneNumber, tinNumber, numberOfEmployees, companyBank, bankAccount);
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

  void loginInWithGoogle() async {
    emit(AuthenticatingGoogle());
    try {
      User? user = await authServices.loginWithGoogle();
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
