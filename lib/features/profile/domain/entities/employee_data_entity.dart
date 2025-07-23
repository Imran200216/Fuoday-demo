class EmployeeEntity {
  final String message;
  final String status;
  final EmployeeDataEntity data;

  EmployeeEntity({
    required this.message,
    required this.status,
    required this.data,
  });
}

class EmployeeDataEntity {
  final String place;
  final String designation;
  final String department;
  final String employmentType;
  final String reportingManagerId;
  final String reportingManagerName;
  final String about;
  final String dob;
  final String? address;
  final String dateOfJoining;
  final String profilePhoto;
  final String name;
  final String email;
  final String personalContactNo;
  final String empId;
  final List<ExperienceEntity> experiences;
  final List<SkillEntity> skills;
  final List<EducationEntity> education;
  final List<OnboardingEntity> onboardings;
  final ReferredSummaryEntity referredSummary;

  EmployeeDataEntity({
    required this.place,
    required this.designation,
    required this.department,
    required this.employmentType,
    required this.reportingManagerId,
    required this.reportingManagerName,
    required this.about,
    required this.dob,
    this.address,
    required this.dateOfJoining,
    required this.profilePhoto,
    required this.name,
    required this.email,
    required this.personalContactNo,
    required this.empId,
    required this.experiences,
    required this.skills,
    required this.education,
    required this.onboardings,
    required this.referredSummary,
  });
}

class ExperienceEntity {
  // Define fields later if needed
  ExperienceEntity();
}

class SkillEntity {
  // Define fields later if needed
  SkillEntity();
}

class EducationEntity {
  final String university;
  final String qualification;
  final String yearOfPassing;

  EducationEntity({
    required this.university,
    required this.qualification,
    required this.yearOfPassing,
  });
}

class OnboardingEntity {
  // Define fields later if needed
  OnboardingEntity();
}

class ReferredSummaryEntity {
  final int total;
  final int? selected;
  final int? onboarded;

  ReferredSummaryEntity({
    required this.total,
    this.selected,
    this.onboarded,
  });
}
