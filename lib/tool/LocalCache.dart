import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanzi/tool/RealSolution.dart';
import 'package:wanzi/tool/RoleData.dart';
import 'package:wanzi/tool/RoleEnum.dart';
import 'package:wanzi/tool/SolveList.dart';

class LocalCache {
  LocalCache._internal();

  factory LocalCache() => _instance;

  static late final LocalCache _instance = LocalCache._internal();

  static late SharedPreferences _preferences;

  static Future<LocalCache> getInstance() async {
    _preferences = await SharedPreferences.getInstance();
    // _settings();
    RealSolution.setRealSolutions();
    return _instance;
  }

  /// 根据key存储int类型
  static Future<bool> setInt(String key, int value) {
    return _preferences.setInt(key, value);
  }

  /// 根据key获取int类型
  static int? getInt(String key) {
    return _preferences.getInt(key);
  }

  /// 根据key存储double类型
  static Future<bool> setDouble(String key, double value) {
    return _preferences.setDouble(key, value);
  }

  /// 根据key获取double类型
  static double? getDouble(
    String key,
  ) {
    return _preferences.getDouble(key);
  }

  /// 根据key存储字符串类型
  static Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  /// 根据key获取字符串类型
  static String? getString(String key) {
    return _preferences.getString(key);
  }

  /// 根据key存储布尔类型
  static Future<bool> setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  /// 根据key获取布尔类型
  static bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  /// 根据key存储字符串类型数组
  static Future<bool> setStringList(String key, List<String> value) {
    return _preferences.setStringList(key, value);
  }

  /// 根据key获取字符串类型数组
  static List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return _preferences.getStringList(key) ?? defaultValue;
  }

  /// 根据key存储Map类型
  static Future<bool> setMap(String key, Map value) {
    return _preferences.setString(key, json.encode(value));
  }

  /// 根据key获取Map类型
  static Map getMap(String key) {
    String jsonStr = _preferences.getString(key) ?? "";
    return jsonStr.isEmpty ? Map : json.decode(jsonStr);
  }

  /// 获取持久化数据中所有存入的key
  static Set<String> getKeys() {
    return _preferences.getKeys();
  }

  /// 获取持久化数据中是否包含某个key
  static bool containsKey(String key) {
    return _preferences.containsKey(key);
  }

  /// 删除持久化数据中某个key
  static Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }

  /// 清除所有持久化数据
  static Future<bool> clear() async {
    return await _preferences.clear();
  }

  /// 重新加载所有数据,仅重载运行时
  static Future<void> reload() async {
    return await _preferences.reload();
  }

  static void _settings() {
    Set<String> keySet = LocalCache.getKeys();
    for (var key in keySet) {
      String defenseKey = key;
      String attackValue = LocalCache.getString(key)!;
      List<String> defenseNameList = defenseKey.split(RoleData.setSplit);
      List<String> attackNameList = attackValue.split(RoleData.setSplit);
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
      bool have = false;
      for (var key in SolveList.solveList.keys) {
        if (listEquals(key, defenseRoleList)) {
          have = true;
          List<List<RoleEnum>> list = SolveList.solveList[key]!;
          list.add(attackRoleList);
          SolveList.solveList[key] = list;
        }
      }
      if (!have) {
        SolveList.solveList[defenseRoleList] = [attackRoleList];
      }
    }
  }
}
