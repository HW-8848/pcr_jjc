import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wanzi/tool/RoleData.dart';
import 'package:wanzi/tool/RoleEnum.dart';
import 'package:wanzi/tool/SaveSolution.dart';

class ShowSolution extends StatefulWidget {
  final List<RoleEnum> defenseList;
  final List<RoleEnum> attackList;
  const ShowSolution(
      {super.key, required this.defenseList, required this.attackList});

  @override
  State<ShowSolution> createState() => _ShowSolutionState();
}

class _ShowSolutionState extends State<ShowSolution> {
  List<RoleEnum> defenseList = [];
  List<RoleEnum> attackList = [];

  String bottleArray = "";

  @override
  void initState() {
    super.initState();
    attackList = widget.attackList;
    defenseList = widget.defenseList;
    for (var defense in widget.defenseList) {
      bottleArray += " ${defense.getName}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "怎么拆$bottleArray",
                style: const TextStyle(fontSize: 15.0, color: Colors.blue),
              ),
              centerTitle: true,
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
}
