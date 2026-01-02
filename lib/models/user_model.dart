class UserModel {
  final String name;
  final String nik;
  final String joinDate;
  final int annualLeave;
  final int usedLeave;
  final int remainingLeave;

  UserModel({
    required this.name,
    required this.nik,
    required this.joinDate,
    required this.annualLeave,
    required this.usedLeave,
    required this.remainingLeave,
  });
}