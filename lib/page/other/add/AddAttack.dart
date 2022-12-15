import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wanzi/page/other/add/AddSolution.dart';
import 'package:wanzi/tool/RoleData.dart';
import 'package:wanzi/tool/RoleEnum.dart';

class AddAttack extends StatefulWidget {
  final List<RoleEnum> defenseList;

  const AddAttack({super.key, required this.defenseList});

  @override
  State<AddAttack> createState() => _AddAttackState();
}

class _AddAttackState extends State<AddAttack> {
  List<RoleEnum> attackList = RoleData.attackList;
  List<RoleEnum> aRoleList = RoleEnum.getARoleList;
  List<RoleEnum> bRoleList = RoleEnum.getBRoleList;
  List<RoleEnum> cRoleList = RoleEnum.getCRoleList;
  List<RoleEnum> defenseList = [];

  @override
  void initState() {
    super.initState();
    attackList.length = 0;
    defenseList = widget.defenseList;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "进攻队(${attackList.length}/5)",
                style: TextStyle(
                  color: (attackList.length == 5 ? Colors.green : Colors.red),
                ),
              ),
              centerTitle: true,
              leading: TextButton(
                child: const Text(
                  "清空",
                  style: TextStyle(color: Colors.green, fontSize: 20.0),
                ),
                onPressed: () {
                  attackList.length = 0;
                  aRoleList = RoleEnum.getARoleList;
                  bRoleList = RoleEnum.getBRoleList;
                  cRoleList = RoleEnum.getCRoleList;
                  setState(() {});
                },
              ),
              actions: [
                TextButton(
                  child: const Text(
                    "提交进攻队",
                    style: TextStyle(color: Colors.green, fontSize: 20.0),
                  ),
                  onPressed: () {
                    if (attackList.isEmpty) {
                      EasyLoading.show(
                        status: "你不进攻了?",
                        indicator: Image.asset(RoleData.long_2),
                      );
                      Future.delayed(
                          Duration(seconds: RoleData.easyLoadingTime), () {
                        EasyLoading.dismiss();
                      });
                    } else if (attackList.length != 5) {
                      EasyLoading.show(
                        status: "不上满我感觉有点悬",
                        indicator: Image.asset(RoleData.long_2),
                      );
                      Future.delayed(
                          Duration(seconds: RoleData.easyLoadingTime), () {
                        EasyLoading.dismiss();
                      });
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddSolution(
                                defenseList: defenseList,
                                attackList: attackList),
                          ));
                    }
                    setState(() {});
                  },
                )
              ],
            ),
            body: ListView(
              children: [
                getDefenseContainer(attackList),
                getLocation("前卫", Colors.blue),
                getRoleContainer(aRoleList),
                getLocation("中卫", Colors.blue),
                getRoleContainer(bRoleList),
                getLocation("后卫", Colors.blue),
                getRoleContainer(cRoleList),
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
                    iconSize: 40,
                    icon: Image.asset(RoleData.getIcon(role)),
                    onPressed: () {
                      RoleData.defenseList.remove(role);
                      switch (role.getLocation) {
                        case RoleData.qianwei:
                          aRoleList.add(role);
                          roleSort(aRoleList);
                          break;
                        case RoleData.zhongwei:
                          bRoleList.add(role);
                          roleSort(bRoleList);
                          break;
                        case RoleData.houwei:
                          cRoleList.add(role);
                          roleSort(cRoleList);
                          break;
                        default:
                          EasyLoading.show(status: "站位异常:请反馈到QQ群797780027");
                          break;
                      }
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
                  onPressed: () {
                    if (attackList.length < 5) {
                      roleList.remove(role);
                      attackList.add(role);
                      defenseRoleSort();
                      roleSort(roleList);
                      setState(() {});
                    }
                  },
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
