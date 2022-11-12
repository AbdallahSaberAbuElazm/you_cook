import 'package:you_cook/features/relish/domain/entities/user_service.dart';

class UserServiceModel extends UserService {
  const UserServiceModel(
      {required super.userId,
      required super.userName,
      required super.email,
      required super.phoneNumber,
      required super.area,
      required super.address});

  static UserServiceModel fromJson(Map<String, dynamic> fromJson) {
    return UserServiceModel(
        userId: fromJson['id'],
        userName: fromJson['first_name'],
        email: fromJson['email'],
        phoneNumber: fromJson['phone'],
        area: fromJson['last_name'],
        address: fromJson['phone_ext']);
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'area': area,
      'address': address,
    };
  }
}
