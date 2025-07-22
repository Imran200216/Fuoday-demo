import 'package:fuoday/features/auth/data/models/admin_user_model.dart';
import 'package:fuoday/features/auth/data/models/employees_details_model.dart';
import 'package:fuoday/features/auth/domain/entities/employee_auth_entities.dart';

class EmployeeDataModel extends EmployeeDataEntity {
  EmployeeDataModel({
    required super.id,
    required super.adminUserId,
    required super.name,
    required super.email,
    required super.role,
    required super.empId,
    required super.group,
    required super.createdAt,
    required super.updatedAt,
    required super.checkin,
    required EmployeeDetailsModel super.employeeDetails,
    required AdminUserModel super.adminUser,
  });

  factory EmployeeDataModel.fromJson(Map<String, dynamic> json) {
    return EmployeeDataModel(
      id: json['id'],
      adminUserId: json['admin_user_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      empId: json['emp_id'],
      group: json['group'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      checkin: json['checkin'],
      employeeDetails: EmployeeDetailsModel.fromJson(json['employee_details']),
      adminUser: AdminUserModel.fromJson(json['admin_user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'admin_user_id': adminUserId,
      'name': name,
      'email': email,
      'role': role,
      'emp_id': empId,
      'group': group,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'checkin': checkin,
      'employee_details': (employeeDetails as EmployeeDetailsModel).toJson(),
      'admin_user': (adminUser as AdminUserModel).toJson(),
    };
  }
}
