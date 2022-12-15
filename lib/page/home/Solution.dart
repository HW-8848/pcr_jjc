import 'package:flutter/material.dart';
import 'package:wanzi/tool/RoleData.dart';
import 'package:wanzi/tool/RoleEnum.dart';

class Solution extends StatefulWidget {
  final List<RoleEnum> defenseList;
  final List<List<RoleEnum>> solveList;
  const Solution(
      {super.key, required this.defenseList, required this.solveList});

  @override
  State<Solution> createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  List<List<RoleEnum>> solutionList = [];
  String bottleArray = "";

  @override
  void initState() {
    super.initState();
    solutionList.length = 0;
    solutionList = widget.solveList;
    for (var defense in widget.defenseList) {
      bottleArray += " ${defense.getName}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "怎么拆$bottleArray",
          style: const TextStyle(fontSize: 15.0, color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0),
        ),
        Column(
            children: solutionList
                .map((solution) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      //交叉轴的布局方式，对于column来说就是水平方向的布局方式
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //就是字child的垂直布局方向，向上还是向下
                      verticalDirection: VerticalDirection.down,
                      children: solution
                          .map((role) => Image.asset(
                                RoleData.getIcon(role),
                                width: 60.0,
                                height: 60.0,
                              ))
                          .toList(),
                    ))
                .toList())
      ]),
    );
  }
}
