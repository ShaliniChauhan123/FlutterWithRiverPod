import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homeScreen/widgets/temporary.dart';
import 'package:flutter_application_1/utils/type_class.dart';

class HorizontalScrollHeader extends StatelessWidget {
  const HorizontalScrollHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CustomObject> headings = [
      const CustomObject(
          title: 'highlights',
          titleColor: Colors.black,
          iconColor: Colors.blue),
      const CustomObject(
          title: 'mojis', titleColor: Colors.blue, iconColor: Colors.blue),
      const CustomObject(
          title: 'Add channel',
          titleColor: Colors.redAccent,
          iconColor: Colors.redAccent),
      const CustomObject(
          title: 'Add channel',
          titleColor: Colors.redAccent,
          iconColor: Colors.redAccent)
    ];

    List<Widget> getList() {
      List<Widget> childs = headings
          .map((e) => Row(children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('#', style: TextStyle(color: e.iconColor)),
                    ),
                    Text(
                      e.title,
                      style: TextStyle(
                          color: e.titleColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                )
              ]))
          .toList();
      return childs;
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListTile(
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 214, 201),
                  ),
                  child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: TempWidget(
                          iconColor: Colors.redAccent,
                          title: 'Add channel',
                          titleColor: Colors.redAccent)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(children: getList()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
