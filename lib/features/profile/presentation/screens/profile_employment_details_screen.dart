import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

class ProfileEmploymentDetailsScreen extends StatefulWidget {
  const ProfileEmploymentDetailsScreen({super.key});

  @override
  State<ProfileEmploymentDetailsScreen> createState() =>
      _ProfileEmploymentDetailsScreenState();
}

class _ProfileEmploymentDetailsScreenState
    extends State<ProfileEmploymentDetailsScreen> {
  // form key
  final formKey = GlobalKey<FormState>();

  // controllers
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController jobRoleController = TextEditingController();
  final TextEditingController dateOfJoinController = TextEditingController();
  final TextEditingController reportingManagerController =
      TextEditingController();
  final TextEditingController employeeIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Employment Details",
        centerTitle: true,
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () {
          GoRouter.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            spacing: 14.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Department
              KAuthTextFormField(
                controller: departmentController,
                label: "Department",
                hintText: "Department",
                suffixIcon: Icons.person_outline,
                isReadOnly: true,
              ),

              // Department
              KAuthTextFormField(
                controller: jobRoleController,
                label: "Job Role",
                hintText: "Job Role",
                suffixIcon: Icons.location_city,
                isReadOnly: true,
              ),

              // Date of join
              KAuthTextFormField(
                controller: dateOfJoinController,
                label: "Date of join",
                hintText: "Date of join",
                suffixIcon: Icons.calendar_month_outlined,
                isReadOnly: true,
              ),

              // Reporting Manager
              KAuthTextFormField(
                controller: reportingManagerController,
                label: "Reporting Manager",
                hintText: "Reporting Manager",
                suffixIcon: Icons.manage_accounts_rounded,
                isReadOnly: true,
              ),

              // Reporting Manager
              KAuthTextFormField(
                controller: employeeIdController,
                label: "Employee Id",
                hintText: "Employee Id",
                suffixIcon: Icons.important_devices,
                isReadOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
