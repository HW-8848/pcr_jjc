import 'package:flutter/material.dart';
import 'package:wanzi/tool/Version.dart';

class Update extends StatelessWidget {
  const Update({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<List<String>> data = Version.data;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "更新记录:${Version.getVersion}",
            style: const TextStyle(color: Colors.green),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: data
                    .map((element) => ListTile(
                          title: Text(element[1],
                              style: const TextStyle(fontSize: 20)),
                          leading: Text(element[0],
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.blue)),
                        ))
                    .toList(),
              ),
            ),
          ],
        ));
  }
}
