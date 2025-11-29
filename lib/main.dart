import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/storage_manager.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 应用全屏、隐藏顶部栏和底部栏
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  /// 捕获 Flutter 的错误
  FlutterError.onError = (FlutterErrorDetails details) {
    // 记录错误信息
    print("捕获全局异常 ${DateTime.now().toLocal()}\n${details.stack.toString()}");
  };

  /// 捕获 Dart 未捕获的异常
  PlatformDispatcher.instance.onError = (error, stack) {
    // 打印异常信息
    print('Dart Error: $error');
    print('Stack trace: $stack');
    // 可以在这里将异常信息发送到服务器
    // sendErrorToServer(error, stack);
    // 返回 true 表示异常已处理
    return true;
  };

  await StorageManager().init();

  runApp(const MyApp());
}
