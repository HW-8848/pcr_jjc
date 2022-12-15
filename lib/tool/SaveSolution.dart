import 'package:wanzi/tool/LocalCache.dart';
import 'package:wanzi/tool/RoleData.dart';
import 'package:wanzi/tool/RoleEnum.dart';

class SaveSolution {
  static bool saveSolution(
      List<RoleEnum> attackList, List<RoleEnum> defenseList) {
    String defenseStringKey = "";
    String attackStringValue = "";
    for (var defenseRole in defenseList) {
      defenseStringKey += "${defenseRole.getName}${RoleData.setSplit}";
    }
    for (var attackRole in attackList) {
      attackStringValue += "${attackRole.getName}${RoleData.setSplit}";
    }
    defenseStringKey =
        defenseStringKey.substring(0, defenseStringKey.length - 1);
    attackStringValue =
        attackStringValue.substring(0, attackStringValue.length - 1);
    LocalCache.setString(defenseStringKey, attackStringValue);
    return true;
  }
}
