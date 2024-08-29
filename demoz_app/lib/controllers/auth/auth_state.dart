import 'package:demoz_app/models/company_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class Authenticating extends AuthState {}

final class AuthenticatingGoogle extends AuthState {}

final class Authenticated extends AuthState {
  final CompanyModel company;
  Authenticated({required this.company});

  @override
  List<Object> get props => [company];
}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}
