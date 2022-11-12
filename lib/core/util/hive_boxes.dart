import 'package:hive/hive.dart';
import 'package:you_cook/features/relish/data/models/user_service.dart';

class HiveBoxes {
  static final _userType = Hive.box<String>('userType');
  static final _userId = Hive.box<int>('userId');
  static final _showHome = Hive.box<bool>('firstOpen');
  static final _userToken = Hive.box<String>('userToken');
  static final _userName = Hive.box<String>('userName');
  static final _email = Hive.box<String>('email');
  static final _phoneNumber = Hive.box<String>('phoneNumber');
  static final _userArea = Hive.box<String>('userArea');
  static final _userAddress = Hive.box<String>('userAddress');

  static setUserData({required UserServiceModel userServiceModel}) {
    setUserId(userId: userServiceModel.userId);
    setUserName(userName: userServiceModel.userName);
    setEmail(email: userServiceModel.email);
    setPhoneNumber(phoneNumber: userServiceModel.phoneNumber);
    setUserArea(userArea: userServiceModel.area);
    setUserAddress(userAddress: userServiceModel.address);
  }

  static removeDataForLogout() {
    setUserName(userName: '');
    setEmail(email: '');
    setUserArea(userArea: '');
    setUserAddress(userAddress: '');

    setPhoneNumber(phoneNumber: '');
  }

  static setUserId({required int userId}) {
    _userId.put('userId', userId);
  }

  static setUserName({required String userName}) {
    _userName.put('userName', userName);
  }

  static setEmail({required String email}) {
    _email.put('email', email);
  }

  static setPhoneNumber({required String phoneNumber}) {
    _phoneNumber.put('phoneNumber', phoneNumber);
  }

  static setUserArea({required String userArea}) {
    _userArea.put('userArea', userArea);
  }

  static setUserAddress({required String userAddress}) {
    _userAddress.put('userAddress', userAddress);
  }

  static changeUserType({required String type}) {
    _userType.put('userType', type);
  }

  static changeShowHome({required bool firstOpen}) {
    _showHome.put('firstOpen', firstOpen);
  }

  static setUserToken({required String userToken}) {
    _userToken.put('userToken', userToken);
  }

  static String? getUserType() => _userType.get('userType');
  static int? getUserId() => _userId.get('userId');
  static bool? getShowHome() => _showHome.get('firstOpen');
  static String? getUserToken() => _userToken.get('userToken');
  static String? getUserName() => _userName.get('userName');
  static String? getEmail() => _email.get('email');
  static String? getPhoneNumber() => _phoneNumber.get('phoneNumber');
  static String? getUserArea() => _userArea.get('userArea');
  static String? getUserAddress() => _userAddress.get('userAddress');
}
