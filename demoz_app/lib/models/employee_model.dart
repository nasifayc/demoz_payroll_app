import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  final String name;
  final String address;
  final String phoneNumber;
  final String tinNumber;
  final String grossSalary;
  final String taxableEarnings;
  final String startingDateOfSalary;

  const EmployeeModel({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.tinNumber,
    required this.grossSalary,
    required this.taxableEarnings,
    required this.startingDateOfSalary,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      tinNumber: json['tinNumber'],
      grossSalary: json['grossSalary'],
      taxableEarnings: json['taxableEarnings'],
      startingDateOfSalary: json['startingDateOfSalary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'tinNumber': tinNumber,
      'grossSalary': grossSalary,
      'taxableEarnings': taxableEarnings,
      'startingDateOfSalary': startingDateOfSalary,
    };
  }

  @override
  List<Object?> get props => [
        name,
        address,
        phoneNumber,
        tinNumber,
        grossSalary,
        taxableEarnings,
        startingDateOfSalary,
      ];
}
