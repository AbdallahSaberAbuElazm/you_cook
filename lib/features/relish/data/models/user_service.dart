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
        userId: fromJson['userId'],
        userName: fromJson['userName'],
        email: fromJson['email'],
        phoneNumber: fromJson['phoneNumber'],
        area: fromJson['area'],
        address: fromJson['address']);
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