import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/core/strings/failure/failure.dart';
import 'package:you_cook/core/util/hive_boxes.dart';
import 'package:you_cook/features/relish/data/models/user_service_model.dart';
import 'package:you_cook/features/relish/domain/entities/user_service.dart';
import 'package:you_cook/features/relish/domain/use_cases/user_usecase/login_user_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/user_usecase/logout_user_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/user_usecase/register_user_usecase.dart';
import 'package:you_cook/features/relish/presentation/controllers/cart_controller.dart';

class UserController extends GetxController {
  final users = <UserService>[].obs;
  var failureTxt = ''.obs;
  var isLoading = true.obs;

  final RegisterUserServiceUsecase registerUserServiceUsecase;
  final LoginUserServiceUsecase loginUserServiceUsecase;
  final LogoutUserServiceUsecase logoutUserServiceUsecase;

  UserController(
      {required this.registerUserServiceUsecase,
      required this.loginUserServiceUsecase,
      required this.logoutUserServiceUsecase});

  // register
  registerUser({required Map<String, dynamic> userInfo}) async {
    try {
      isLoading(true);
      var userData = await registerUserServiceUsecase(userData: userInfo);
      _mapFailureOrUnit(userData);
    } finally {
      isLoading(false);
    }
  }

  //login
  loginUser({required String email, required String password}) async {
    try {
      isLoading(true);
      var userData =
          await loginUserServiceUsecase(email: email, password: password);
      _mapFailureOrUser(userData);
    } finally {
      isLoading(false);
    }
  }

  // logout
  logoutUser({required String accessToken}) async {
    try {
      isLoading(true);
      var userData = await logoutUserServiceUsecase(accessToken: accessToken);
      _mapFailureOrUnit(userData);
    } finally {
      isLoading(false);
    }
  }

  updateUserData({required UserServiceModel userInfo}) {
    HiveBoxes.setUserData(userServiceModel: userInfo);
  }

  _mapFailureOrUser(Either<Failure, UserService> either) {
    return either.fold((failure) {
      failureTxt.value = mapFailureToMessage(failure);
    }, (userData) {
      failureTxt.value = '';
      users.add(userData);
    });
  }

  _mapFailureOrUnit(Either<Failure, Unit> either) {
    return either.fold((failure) {
      failureTxt.value = mapFailureToMessage(failure);
    }, (userData) {
      failureTxt.value = '';
      Get.find<CartController>();
    });
  }
}
