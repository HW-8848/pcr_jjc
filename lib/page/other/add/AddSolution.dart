import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wanzi/tool/RoleData.dart';
import 'package:wanzi/tool/RoleEnum.dart';
import 'package:wanzi/tool/SaveSolution.dart';

class AddSolution extends StatefulWidget {
  final List<RoleEnum> defenseList;
  final List<RoleEnum> attackList;
  const AddSolution(
      {super.key, required this.defenseList, required this.attackList});

  @override
  State<AddSolution> createState() => _AddSolutionState();
}

class _AddSolutionState extends State<AddSolution> {
  List<RoleEnum> defenseList = [];
  List<RoleEnum> attackList = [];

  @override
  void initState() {
    super.initState();
    attackList = widget.attackList;
    defenseList = widget.defenseList;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "保存解法",
                style: TextStyle(
                  color: (defenseList.length == 5 ? Colors.green : Colors.red),
                ),
              ),
              centerTitle: true,
              actions: [
                TextButton(
                  child: const Text(
                    "保存",
                    style: TextStyle(color: Colors.green, fontSize: 20.0),
                  ),
                  onPressed: () {
                    if (SaveSolution.saveSolution(attackList, defenseList)) {
                      EasyLoading.show(
                          status: "保存成功,解法重启后生效",
                          indicator: Image.asset(RoleData.long_4));
                      Future.delayed(
                          Duration(seconds: RoleData.easyLoadingTime), () {
                        EasyLoading.dismiss();
                      });
                    } else {
                      EasyLoading.show(
                          status: "保存失败,请重启后重试,QQ群797780027",
                          indicator: Image.asset(RoleData.long_3));
                    }
                  },
                )
              ],
              automaticallyImplyLeading: false,
            ),
            body: ListView(
              children: [
                Container(margin: const EdgeInsets.only(top: 20.0)),
                getLocation("进攻队", Colors.blue),
                getDefenseContainer(attackList),
                Container(margin: const EdgeInsets.only(top: 20.0)),
                getLocation("防守队", Colors.blue),
                getDefenseContainer(defenseList),
                Container(margin: const EdgeInsets.only(top: 20.0)),
                getLocation("如曾添加过该防守队的解法(程序录入的解法除外)，将会覆盖原添加的数据", Colors.green),
              ],
            )));
  }

  Container getDefenseContainer(List<RoleEnum> attackList) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          //交叉轴的布局方式，对于column来说就是水平方向的布局方式
          crossAxisAlignment: CrossAxisAlignment.center,
          //就是字child的垂直布局方向，向上还是向下
          verticalDirection: VerticalDirection.down,
          children: attackList
              .map((role) => IconButton(
                    iconSize: 46,
                    icon: Image.asset(RoleData.getIcon(role)),
                    onPressed: () {
                      setState(() {});
                    },
                  ))
              .toList(),
        ));
  }

  Container getRoleContainer(List<RoleEnum> roleList) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: roleList
            .map((role) => IconButton(
                  color: Colors.red,
                  iconSize: 48,
                  icon: Image.asset(RoleData.getIcon(role)),
                  tooltip: role.getName,
                  onPressed: () {},
                ))
            .toList(),
      ),
    );
  }

  Container getLocation(String location, Color textColor) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Text(
        location,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor, fontSize: 20.0),
      ),
    );
  }

  void defenseRoleSort() {
    defenseList.sort(((a, b) => int.parse(b.getId) - int.parse(a.getId)));
  }

  void roleSort(List<RoleEnum> roleList) {
    roleList.sort(((a, b) => int.parse(a.getId) - int.parse(b.getId)));
  }
}
