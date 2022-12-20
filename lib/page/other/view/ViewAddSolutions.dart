import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wanzi/page/other/view/ShowSolutioin.dart';
import 'package:wanzi/tool/LocalCache.dart';
import 'package:wanzi/tool/RealSolution.dart';
import 'package:wanzi/tool/RoleData.dart';
import 'package:wanzi/tool/RoleEnum.dart';

class ViewAddSolutions extends StatefulWidget {
  const ViewAddSolutions({super.key});

  @override
  State<ViewAddSolutions> createState() => _ViewAddSolutionsState();
}

class _ViewAddSolutionsState extends State<ViewAddSolutions> {
  List<List<RoleEnum>> temporaryList = RealSolution.userSolutions.keys.toList();
  double imageSize = 50.0;
  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: Scaffold(
        appBar: AppBar(
          title: TextButton(
            child: const Text(
              "点击删除添加的所有解法",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              if (!LocalCache.containsKey(RoleData.userSolutionKey) ||
                  LocalCache.getMap(RoleData.userSolutionKey).isEmpty) {
                EasyLoading.show(
                    status: "龙哑人...", indicator: Image.asset(RoleData.long_3));
                Future.delayed(
                  Duration(seconds: RoleData.easyLoadingTime),
                  () {
                    EasyLoading.dismiss();
                  },
                );
              } else {
                LocalCache.remove(RoleData.userSolutionKey);
                temporaryList.length = 0;
                EasyLoading.show(
                    status: "删除成功，重启后生效",
                    indicator: Image.asset(RoleData.long_4));
                Future.delayed(
                  Duration(seconds: RoleData.easyLoadingTime),
                  () {
                    EasyLoading.dismiss();
                  },
                );
              }
              setState(() {});
            },
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: ListView(
            children: temporaryList
                .toList()
                .map((defenseList) => showAddSolutions(defenseList))
                .toList()),
      ),
    );
  }

  Widget showAddSolutions(List<RoleEnum> defenseList) {
    return ListTile(
      title: roleShow(defenseList),
      trailing: deleteButtion(defenseList),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowSolution(
                  defenseList: defenseList,
                  attackList: RealSolution.userSolutions[defenseList]!.first),
            ))
      },
    );
  }

  Container roleShow(List<RoleEnum> defenseList) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0, left: 0.0, right: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.max,
          // 交叉轴的布局方式，对于column来说就是水平方向的布局方式
          // crossAxisAlignment: CrossAxisAlignment.center,
          // 就是字child的垂直布局方向，向上还是向下
          // verticalDirection: VerticalDirection.down,
          children: defenseList
              .map((role) => Image.asset(
                    RoleData.getIcon(role),
                    width: imageSize,
                    height: imageSize,
                  ))
              .toList(),
        ));
  }

  Widget deleteButtion(List<RoleEnum> defenseList) {
    return TextButton(
      child: Icon(
        Icons.delete,
        size: imageSize,
      ),
      onPressed: () {
        RealSolution.deleteAddSolution(defenseList);
        temporaryList.remove(defenseList);
        EasyLoading.show(
            status: "删除成功，重启后生效", indicator: Image.asset(RoleData.long_4));
        Future.delayed(Duration(seconds: RoleData.easyLoadingTime), () {
          EasyLoading.dismiss();
        });
        setState(() {});
      },
    );
  }
}
