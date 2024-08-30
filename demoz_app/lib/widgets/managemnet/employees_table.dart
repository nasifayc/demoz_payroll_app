import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/models/company_model.dart';
import 'package:demoz_app/widgets/common/static_utils.dart';
import 'package:flutter/material.dart';

class EmployeesTable extends StatefulWidget {
  final String userId;
  const EmployeesTable({super.key, required this.userId});

  @override
  State<EmployeesTable> createState() => _EmployeesTableState();
}

class _EmployeesTableState extends State<EmployeesTable> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          CompanyModel company = CompanyModel.fromJson(
              snapshot.data!.data() as Map<String, dynamic>);
          if (company.employees.isEmpty) {
            return Center(
              child: Text(
                "you haven't registered any employee yet.",
                style: theme.typography.titleMedium,
              ),
            );
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(
                    label: Text(
                  'Employees',
                  style: theme.typography.displayMedium,
                )),
                DataColumn(
                    label: Text('Net Salary',
                        style: theme.typography.displayMedium)),
                DataColumn(
                    label: Text('Taxable Earnings',
                        style: theme.typography.displayMedium)),
                DataColumn(
                    label: Text('Incoming Tax',
                        style: theme.typography.displayMedium)),
              ],
              rows: company.employees.map((employee) {
                return DataRow(cells: [
                  DataCell(Text(employee.name,
                      style: theme.typography.displaySmall)),
                  DataCell(Text(employee.grossSalary.toString(),
                      style: theme.typography.displaySmall)),
                  DataCell(Text(employee.taxableEarnings.toString(),
                      style: theme.typography.displaySmall)),
                  DataCell(Text('${employee.grossSalary * 0.15}',
                      style: theme.typography.displaySmall)),
                ]);
              }).toList(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return StaticUtils.getShimmerEffect(theme);
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: theme.typography.displayMedium,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
