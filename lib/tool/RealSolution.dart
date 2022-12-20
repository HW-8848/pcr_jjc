import 'package:flutter/foundation.dart';
import 'package:wanzi/tool/LocalCache.dart';
import 'package:wanzi/tool/RoleData.dart';
import 'package:wanzi/tool/RoleEnum.dart';
import 'package:wanzi/tool/SolveList.dart';

class RealSolution {
  static Map<List<RoleEnum>, List<List<RoleEnum>>> authorSolutions =
      SolveList.solveList;
  static Map<List<RoleEnum>, List<List<RoleEnum>>> userSolutions =
      RoleData.getUserSolutions;
  static Map<List<RoleEnum>, List<List<RoleEnum>>> realSolutions = {};

  static Map<List<RoleEnum>, List<List<RoleEnum>>> get getRealSolutions {
    return realSolutions;
  }

  static void setRealSolutions() {
    // 仅显示个人添加的解法
    if (LocalCache.getBool(RoleData.userSelectSolutionKey) ?? false) {
      realSolutions = userSolutions;
    } else {
      realSolutions.addAll(authorSolutions);
      // 原数据是否有解
      bool have;
      // 判定循环完毕
      int length;
      userSolutions.forEach((ukey, uValue) {
        have = false;
        length = 0;
        realSolutions.forEach((rkey, rValue) {
          if (listEquals(ukey, rkey)) {
            realSolutions[rkey] = uValue;
            have = true;
          } else {
            length++;
          }
        });
        // 原数据无解
        if (!have && length == realSolutions.length) {
          realSolutions[ukey] = uValue;
        }
      });
    }
  }

  static void deleteAddSolution(List<RoleEnum> defenseList) {
    for (var key in userSolutions.keys) {
      if (listEquals(key, defenseList)) {
        String solutionName = "";
        for (var role in key) {
          solutionName += "${role.getName}${RoleData.setSplit}";
        }
        solutionName = solutionName.substring(0, solutionName.length - 1);
        Map map = LocalCache.getMap(RoleData.userSolutionKey);
        map.remove(solutionName);
        LocalCache.setMap(RoleData.userSolutionKey, map);
      }
    }
  }
}
