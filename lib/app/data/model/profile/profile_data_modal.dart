class UserProfileModel {
  final String? id;
  final String? uniqueId;
  final String? username;
  final String? fullName;
  final String? email;
  final String? mobileNo;
  final bool? isActive;
  final bool? isAdmin;
  final String? status;
  final int? accountType;

  UserProfileModel({
    this.id,
    this.uniqueId,
    this.username,
    this.fullName,
    this.email,
    this.mobileNo,
    this.isActive,
    this.isAdmin,
    this.status,
    this.accountType,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      uniqueId: json['unique_id'],
      username: json['username'],
      fullName: json['full_name'],
      email: json['email'],
      mobileNo: json['mobile_no'],
      isActive: json['is_active'],
      isAdmin: json['is_admin'],
      status: json['status'],
      accountType: json['account_type'],
    );
  }
}