import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';

class UserViewModel extends StateNotifier<UserModel> {
  UserViewModel()
      : super(UserModel(
    name: 'Eunah Kim',
    nik: '20240101',
    joinDate: 'Tgl Masuk Kerja',
    annualLeave: 12,
    usedLeave: 10,
    remainingLeave: 2,
  ));
}

final userProvider = StateNotifierProvider<UserViewModel, UserModel>((ref) => UserViewModel());