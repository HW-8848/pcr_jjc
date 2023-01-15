import 'package:flutter/foundation.dart';
import 'package:wanzi/tool/LocalCache.dart';
import 'package:wanzi/tool/RealSolution.dart';
import 'package:wanzi/tool/RoleEnum.dart';

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
    for (var defense in RealSolution.realSolutions.keys) {
      if (listEquals(defense, defenseList)) {
        return RealSolution.getRealSolutions[defense];
      }
    }
    return list;
  }

  static Map<List<RoleEnum>, List<List<RoleEnum>>> get getUserSolutions {
    if (!LocalCache.containsKey(RoleData.userSolutionKey)) {
      return {};
    }
    Map<List<RoleEnum>, List<List<RoleEnum>>> userSolutionsMap = {};
    Map userSolutionMap = LocalCache.getMap(RoleData.userSolutionKey);
    userSolutionMap.forEach((defenseName, attackName) {
      List<String> defenseNameList = defenseName.split(RoleData.setSplit);
      List<String> attackNameList = attackName.split(RoleData.setSplit);
      List<RoleEnum> defenseRoleList = [];
      List<RoleEnum> attackRoleList = [];
      for (var defenseName in defenseNameList) {
        Iterable<RoleEnum> roleEnum =
            RoleEnum.values.where((role) => role.getName == defenseName);
        defenseRoleList.add(roleEnum.first);
      }
      for (var attackName in attackNameList) {
        Iterable<RoleEnum> roleEnum =
            RoleEnum.values.where((role) => role.getName == attackName);
        attackRoleList.add(roleEnum.first);
      }
      userSolutionsMap[defenseRoleList] = [attackRoleList];
    });
    return userSolutionsMap;
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

  /// 是否仅显示个人添加的解法
  static String get userSelectSolutionKey {
    return "userSelectSolutionKey";
  }

  /// 用户添加的解法Key
  static String get userSolutionKey {
    return "userSolution";
  }

  static const String qianwei = "1";
  static const String zhongwei = "2";
  static const String houwei = "3";
}
