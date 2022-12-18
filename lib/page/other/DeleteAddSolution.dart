import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wanzi/tool/LocalCache.dart';
import 'package:wanzi/tool/RoleData.dart';

class DeleteAddSolution extends StatelessWidget {
  const DeleteAddSolution({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
        child: Scaffold(
      appBar: AppBar(
        title: TextButton(
          child: const Text("点击删除添加的所有解法"),
          onPressed: () {
            LocalCache.remove(RoleData.userSolutionKey);
            EasyLoading.show(
                status: "删除成功，重启后生效", indicator: Image.asset(RoleData.long_3));
            Future.delayed(
              Duration(seconds: RoleData.easyLoadingTime),
              () {
                EasyLoading.dismiss();
              },
            );
          },
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
    ));
  }
}
