import 'package:flutter/material.dart';
import 'package:wanzi/page/other/DeleteAddSolution.dart';
import 'package:wanzi/page/other/Update.dart';
import 'package:wanzi/page/other/add/AddDefense.dart';
import 'package:wanzi/tool/RoleData.dart';
import 'package:wanzi/tool/SolveList.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
            "删除新增的全部解法",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: const Text("delete all add new solution"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeleteAddSolution(),
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
            "角色列表",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: const Text("list of roles"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          enabled: false,
          onTap: () => {},
        ),
        ListTile(
          title: Text(
            "已记录${SolveList.solveList.length}组防守队",
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text("There are ${SolveList.solveList.length} solutions"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          enabled: false,
          onTap: () => {},
        ),
      ],
    );
  }
}
