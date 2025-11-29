import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  /// 私有的命名构造函数
  StorageManager._internal();

  /// 直接初始化
  static final StorageManager _instance = StorageManager._internal();

  /// 工厂构造函数 获取实例
  factory StorageManager() => _instance;

  static late SharedPreferences prefs;

  // init
  Future<SharedPreferences> init() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}
