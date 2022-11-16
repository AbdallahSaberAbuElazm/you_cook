import 'package:equatable/equatable.dart';

class UserService extends Equatable {
  final int userId;
  final String userName;
  final String phoneNumber;
  final String email;
  final String area;
  final String address;
  String? image = '';

  UserService(
      {required this.userId,
      required this.userName,
      required this.phoneNumber,
      required this.email,
      required this.area,
      required this.address,
      this.image});

  @override
  List<Object?> get props => [userId, userName, email, area, address, image];
}
