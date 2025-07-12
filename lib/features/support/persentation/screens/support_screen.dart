import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/commons/widgets/k_drop_down_text_form_field.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  // controllers
  final TextEditingController dateMonthYearController = TextEditingController();
  final TextEditingController assignToPersonController =
      TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController ticketController = TextEditingController();

  @override
  void dispose() {
    dateMonthYearController.dispose();
    assignToPersonController.dispose();
    userIdController.dispose();
    categoryController.dispose();
    ticketController.dispose();
    super.dispose();
  }

  // Select Priority Level
  String? selectedPriorityLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Support",
        centerTitle: true,
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () {
          GoRouter.of(context).pop();
        },
      ),
      bottomSheet: Container(
        height: 60.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Center(
          child: KAuthFilledBtn(
            backgroundColor: AppColors.primaryColor,
            height: 24.h,
            width: double.infinity,
            text: "Raise Ticket",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Important!
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                ),
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      bottom:
                          MediaQuery.of(context).viewInsets.bottom +
                          20.h, // keyboard aware
                      top: 20.h,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Drag handle
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 2.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColors.greyColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),

                          KText(
                            text: "Create Ticket",
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),

                          SizedBox(height: 20.h),

                          // Your KAuthTextFormField widgets...
                          KAuthTextFormField(
                            hintText: "Enter Date",
                            onTap: () {},
                            controller: dateMonthYearController,
                            keyboardType: TextInputType.datetime,
                            suffixIcon: Icons.date_range,
                          ),

                          SizedBox(height: 10.h),

                          KDropdownTextFormField<String>(
                            hintText: "Select Category",
                            value: selectedPriorityLevel,
                            items: ['High', 'Medium', 'Low'],
                            onChanged: (value) {
                              setState(() {
                                selectedPriorityLevel = value;
                              });
                            },
                          ),

                          SizedBox(height: 10.h),

                          KAuthTextFormField(
                            hintText: "Assign To (Optional)",
                            controller: assignToPersonController,
                            keyboardType: TextInputType.name,
                            suffixIcon: Icons.person,
                          ),

                          SizedBox(height: 10.h),

                          KAuthTextFormField(
                            hintText: "Enter User Id",
                            controller: userIdController,
                            keyboardType: TextInputType.text,
                            suffixIcon: Icons.important_devices,
                          ),

                          SizedBox(height: 10.h),

                          KAuthTextFormField(
                            hintText: "Enter Category",
                            controller: categoryController,
                            keyboardType: TextInputType.text,
                            suffixIcon: Icons.category_rounded,
                          ),

                          SizedBox(height: 10.h),

                          KAuthTextFormField(
                            maxLines: 4,
                            hintText: "Describe the issues",
                            controller: ticketController,
                            keyboardType: TextInputType.text,
                            suffixIcon: Icons.description,
                          ),

                          SizedBox(height: 30.h),

                          // Cancel
                          KAuthFilledBtn(
                            height: 24.h,
                            width: double.infinity,
                            text: "Cancel",
                            fontSize: 10.sp,
                            textColor: AppColors.primaryColor,
                            onPressed: () {},
                            backgroundColor: AppColors.primaryColor.withOpacity(
                              0.4,
                            ),
                          ),

                          SizedBox(height: 12.h),

                          KAuthFilledBtn(
                            height: 24.h,
                            fontSize: 10.sp,
                            width: double.infinity,
                            text: "Submit",
                            textColor: AppColors.secondaryColor,
                            onPressed: () {},
                            backgroundColor: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            fontSize: 11.sp,
          ),
        ),
      ),
      body: Center(child: Text("hi support")),
    );
  }
}
