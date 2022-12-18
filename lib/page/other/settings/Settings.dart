import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wanzi/tool/LocalCache.dart';
import 'package:wanzi/tool/RoleData.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _userSelectSolutionKey = false;

  @override
  void initState() {
    super.initState();
    _userSelectSolutionKey =
        LocalCache.getBool(RoleData.userSelectSolutionKey) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("其它设置"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0),
          ),
          ListTile(
            title: const Text(
              "仅显示个人添加的解法",
              style: TextStyle(fontSize: 20),
            ),
            subtitle:
                const Text("only individually added solutions are displayed"),
            trailing: Switch(
                value: _userSelectSolutionKey,
                onChanged: (newSelect) {
                  print(newSelect);
                  setState(() {
                    LocalCache.setBool(
                        RoleData.userSelectSolutionKey, newSelect);
                    _userSelectSolutionKey = !_userSelectSolutionKey;
                    EasyLoading.show(status: "设置完成，请重新启动程序");
                  });
                }),
          ),
        ],
      ),
    ));
  }
}
