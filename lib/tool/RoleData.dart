import 'package:flutter/foundation.dart';
import 'package:wanzi/tool/RoleEnum.dart';
import 'package:wanzi/tool/SolveList.dart';

class RoleData {
  static String getIcon(RoleEnum role) {
    return "images/role/${role.getId}_${role.getName}.jpg";
  }

  static List<RoleEnum> defenseList = [
    RoleEnum.youshu,
    RoleEnum.youshu,
    RoleEnum.youshu,
    RoleEnum.youshu,
    RoleEnum.youshu
  ];

  static List<RoleEnum> attackList = [
    RoleEnum.youshu,
    RoleEnum.youshu,
    RoleEnum.youshu,
    RoleEnum.youshu,
    RoleEnum.youshu
  ];

  static List<List<RoleEnum>>? toSolve(List<RoleEnum> defenseList) {
    List<List<RoleEnum>>? list = [];
    for (var defense in SolveList.solveList.keys) {
      if (listEquals(defense, defenseList)) {
        return SolveList.solveList[defense];
      }
    }
    return list;
  }

  static String get kailu {
    return "images/other/kailu.gif";
  }

  static String get jijian {
    return "images/other/jijian.gif";
  }

  static String get cat {
    return "images/other/cat.gif";
  }

  static String get long_1 {
    return "images/long/long_1.jpg";
  }

  static String get long_2 {
    return "images/long/long_2.gif";
  }

  static String get long_3 {
    return "images/long/long_3.jpg";
  }

  static String get long_4 {
    return "images/long/long_4.gif";
  }

  static int get easyLoadingTime {
    return 2;
  }

  static String get setSplit {
    return "+";
  }

  static const String qianwei = "1";
  static const String zhongwei = "2";
  static const String houwei = "3";
}
