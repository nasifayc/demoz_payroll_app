import 'package:demoz_app/models/employee_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CompanyModel extends Equatable {
  final String id;
  final String email;
  String? password;
  String? companyName;
  String? address;
  String? phoneNumber;
  String? tinNumber;
  int? numberOfEmployees;
  String? companyBank;
  String? bankAccountNumber;
  List<EmployeeModel> employees;

  CompanyModel(
      {required this.id,
      required this.email,
      this.password,
      this.companyName,
      this.address,
      this.phoneNumber,
      this.tinNumber,
      this.numberOfEmployees,
      this.companyBank,
      this.bankAccountNumber,
      this.employees = const []});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      email: json['email'],
      companyName: json['companyName'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      tinNumber: json['tinNumber'],
      numberOfEmployees: json['numberOfEmployees'],
      companyBank: json['companyBank'],
      bankAccountNumber: json['bankAccountNumber'],
      employees:
          json['employees']?.map((e) => EmployeeModel.fromJson(e)).toList() ??
              [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
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
