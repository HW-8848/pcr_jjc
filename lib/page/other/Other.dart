import 'package:flutter/material.dart';
import 'package:wanzi/page/other/Update.dart';
import 'package:wanzi/page/other/add/AddDefense.dart';
import 'package:wanzi/page/other/settings/Settings.dart';
import 'package:wanzi/page/other/view/ViewAddSolutions.dart';
import 'package:wanzi/tool/RealSolution.dart';
import 'package:wanzi/tool/RoleData.dart';

class Other extends StatelessWidget {
  const Other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(RoleData.cat),
        ListTile(
          title: const Text(
            "添加解法",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: const Text("add new solution"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddDefense(),
                ))
          },
        ),
        ListTile(
          title: const Text(
            "查看添加的解法",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: const Text("view add solutions"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewAddSolutions(),
                ))
          },
        ),
        ListTile(
          title: const Text(
            "更新记录",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: const Text("update record"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Update(),
                ))
          },
        ),
        ListTile(
          title: const Text(
            "其它设置",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: const Text("other settings"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ))
          },
        ),
        ListTile(
          title: Text(
            "已记录${RealSolution.realSolutions.length}组防守队",
            style: const TextStyle(fontSize: 20),
          ),
          subtitle:
              Text("There are ${RealSolution.realSolutions.length} solutions"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          enabled: false,
          onTap: () => {},
        ),
      ],
    );
  }
}
