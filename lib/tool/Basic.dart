import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wanzi/page/home/JjcHome.dart';
import 'package:wanzi/page/other/Other.dart';

class Basic extends StatefulWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  State<Basic> createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  List<Widget> listBody = [const JjcHome(), const Other()];
  int listIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomItems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "主页",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: "其它",
      ),
    ];

    return MaterialApp(
      title: "nonono二赖子",
      //白天模式
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: "FZ",
      ),
      //夜间模式
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "FZ",
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        body: listBody[listIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: bottomItems,
          currentIndex: listIndex,
          onTap: (index) {
            _chagePage(index);
          },
        ),
      ),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    );
  }

  void _chagePage(int num) {
    if (num != listIndex) {
      setState(() {
        listIndex = num;
      });
    }
  }
}
