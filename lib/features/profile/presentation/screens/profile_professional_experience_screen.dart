import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

class ProfessionalExperience {
  final TextEditingController companyNameController;
  final TextEditingController noOfYearsController;
  final TextEditingController roleController;
  final TextEditingController durationController;
  final TextEditingController achievementsController;
  final String id;

  ProfessionalExperience({String? id})
    : companyNameController = TextEditingController(),
      noOfYearsController = TextEditingController(),
      roleController = TextEditingController(),
      durationController = TextEditingController(),
      achievementsController = TextEditingController(),
      id = id ?? DateTime.now().millisecondsSinceEpoch.toString();

  void dispose() {
    companyNameController.dispose();
    noOfYearsController.dispose();
    roleController.dispose();
    durationController.dispose();
    achievementsController.dispose();
  }

  Map<String, String> toMap() {
    return {
      'companyName': companyNameController.text,
      'noOfYears': noOfYearsController.text,
      'role': roleController.text,
      'duration': durationController.text,
      'achievements': achievementsController.text,
    };
  }

  bool get isEmpty {
    return companyNameController.text.trim().isEmpty &&
        noOfYearsController.text.trim().isEmpty &&
        roleController.text.trim().isEmpty &&
        durationController.text.trim().isEmpty &&
        achievementsController.text.trim().isEmpty;
  }
}

class ProfileProfessionalExperienceScreen extends StatefulWidget {
  const ProfileProfessionalExperienceScreen({super.key});

  @override
  State<ProfileProfessionalExperienceScreen> createState() =>
      _ProfileProfessionalExperienceScreenState();
}

class _ProfileProfessionalExperienceScreenState
    extends State<ProfileProfessionalExperienceScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<ProfessionalExperience> _experiences = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add initial experience form
    _addNewExperience();
  }

  void _addNewExperience() {
    setState(() {
      _experiences.add(ProfessionalExperience());
    });

    // Scroll to bottom after adding new experience
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _removeExperience(int index) {
    if (_experiences.length > 1) {
      setState(() {
        _experiences[index].dispose();
        _experiences.removeAt(index);
      });
    } else {
      // Show snackbar if trying to remove the last experience
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('At least one professional experience is required'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Filter out empty experiences
      List<ProfessionalExperience> validExperiences = _experiences
          .where((exp) => !exp.isEmpty)
          .toList();

      if (validExperiences.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill at least one professional experience'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }

      // Convert to data format
      List<Map<String, String>> experienceData = validExperiences
          .map((exp) => exp.toMap())
          .toList();

      // TODO: Submit data to your backend or state management
      print('Professional Experiences: $experienceData');

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${validExperiences.length} professional experience(s) submitted successfully!',
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Widget _buildExperienceCard(int index) {
    final experience = _experiences[index];

    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with experience number and delete button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Professional Experience ${index + 1}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.titleColor,
                  ),
                ),
                if (_experiences.length > 1)
                  IconButton(
                    onPressed: () => _removeExperience(index),
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                      size: 20.sp,
                    ),
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  ),
              ],
            ),

            SizedBox(height: 16.h),

            // Form fields
            Column(
              spacing: 14.h,
              children: [
                // Company name
                KAuthTextFormField(
                  controller: experience.companyNameController,
                  hintText: "Company Name",
                  suffixIcon: Icons.location_city,
                  label: "Company Name",
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Company name is required';
                    }
                    return null;
                  },
                ),

                // No of years
                KAuthTextFormField(
                  controller: experience.noOfYearsController,
                  hintText: "No of years",
                  suffixIcon: Icons.timelapse_outlined,
                  label: "No of years",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Number of years is required';
                    }
                    if (double.tryParse(value!) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),

                // Role
                KAuthTextFormField(
                  controller: experience.roleController,
                  hintText: "Role",
                  suffixIcon: Icons.person_outline,
                  label: "Role",
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Role is required';
                    }
                    return null;
                  },
                ),

                // Duration
                KAuthTextFormField(
                  controller: experience.durationController,
                  hintText: "Duration (e.g., Jan 2020 - Dec 2022)",
                  suffixIcon: Icons.date_range_outlined,
                  label: "Duration",
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Duration is required';
                    }
                    return null;
                  },
                ),

                // Achievements
                KAuthTextFormField(
                  controller: experience.achievementsController,
                  hintText: "Achievements",
                  suffixIcon: Icons.wine_bar,
                  label: "Achievements",
                  maxLines: 3,
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Achievements are required';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var experience in _experiences) {
      experience.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        actionsWidgets: [
          IconButton(
            onPressed: _addNewExperience,
            icon: Icon(
              Icons.add_circle_outlined,
              color: AppColors.secondaryColor,
            ),
            tooltip: 'Add New Experience',
          ),
        ],
        title: "Professional Experience",
        centerTitle: true,
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () {
          GoRouter.of(context).pop();
        },
      ),
      bottomSheet: Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Center(
          child: Column(
            spacing: 12.h,
            children: [
              KAuthFilledBtn(
                backgroundColor: AppColors.primaryColor.withOpacity(0.4),
                fontSize: 10.sp,
                text: "Cancel",
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                height: 22.h,
                width: double.infinity,
              ),

              // Submit Button
              KAuthFilledBtn(
                backgroundColor: AppColors.primaryColor,
                fontSize: 10.sp,
                text:
                    "Submit (${_experiences.length} Experience${_experiences.length > 1 ? 's' : ''})",
                onPressed: _submitForm,
                height: 22.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            padding: EdgeInsets.only(bottom: 120.h), // Space for bottom sheet
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header text
                Text(
                  'Add your professional experiences below. You can add multiple experiences by tapping the + button.',
                  style: TextStyle(fontSize: 12.sp, color: AppColors.greyColor),
                ),

                SizedBox(height: 20.h),

                // Dynamic experience cards
                ..._experiences.asMap().entries.map(
                  (entry) => _buildExperienceCard(entry.key),
                ),

                // Add more button (alternative to app bar button)
                Center(
                  child: OutlinedButton.icon(
                    onPressed: _addNewExperience,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Another Experience'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: BorderSide(color: AppColors.primaryColor),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 12.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
