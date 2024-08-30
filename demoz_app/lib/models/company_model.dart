import 'package:demoz_app/models/employee_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CompanyModel extends Equatable {
  final String id;
  final String email;
  String? password;
  String? photo;
  final String companyName;
  final String address;
  final String phoneNumber;
  final String tinNumber;
  final int numberOfEmployees;
  final String companyBank;
  final String bankAccountNumber;
  List<EmployeeModel> employees;

  CompanyModel(
      {required this.id,
      required this.email,
      this.password,
      this.photo,
      required this.companyName,
      required this.address,
      required this.phoneNumber,
      required this.tinNumber,
      required this.numberOfEmployees,
      required this.companyBank,
      required this.bankAccountNumber,
      this.employees = const []});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      email: json['email'],
      photo: json['photo'],
      companyName: json['companyName'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      tinNumber: json['tinNumber'],
      numberOfEmployees: json['numberOfEmployees'],
      companyBank: json['companyBank'],
      bankAccountNumber: json['bankAccountNumber'],
      employees: (json['employees'] as List<dynamic>)
          .map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'photo': photo,
      'companyName': companyName,
      'address': address,
      'phoneNumber': phoneNumber,
      'tinNumber': tinNumber,
      'numberOfEmployees': numberOfEmployees,
      'companyBank': companyBank,
      'bankAccountNumber': bankAccountNumber,
      'employees': employees.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        email,
        photo,
        password,
        companyName,
        address,
        phoneNumber,
        tinNumber,
        numberOfEmployees,
        companyBank,
        bankAccountNumber,
      ];
}
