import 'package:hive/hive.dart';

class InitHiveBoxesConfiguration {
  static Future initHiveBoxes() async {
    await Hive.openBox<String>('userType');
    await Hive.openBox<int>('userId');
    await Hive.openBox<bool>('firstOpen');
    await Hive.openBox<String>('userToken');
    await Hive.openBox<String>('userName');
    await Hive.openBox<String>('email');
    await Hive.openBox<String>('phoneNumber');
    await Hive.openBox<String>('userArea');
    await Hive.openBox<String>('userAddress');
    await Hive.openBox<String>('userImageProfile');
  }
}
