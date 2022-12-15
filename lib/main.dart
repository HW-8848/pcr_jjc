import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanzi/tool/LocalCache.dart';

import 'tool/Basic.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    // 强制竖屏
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  realRunApp();
}

void realRunApp() async {
  await LocalCache.getInstance();
  runApp(const Basic());
}
