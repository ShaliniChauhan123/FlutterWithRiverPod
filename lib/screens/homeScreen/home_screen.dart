import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homeScreen/widgets/app_header.dart';
import 'package:flutter_application_1/screens/homeScreen/widgets/horizontal_scroll_header.dart';
import 'package:flutter_application_1/screens/homeScreen/widgets/listview_home.dart';
import 'package:flutter_application_1/screens/homeScreen/widgets/space_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        drawer: const Drawer(),
        appBar: AppBar(
          title: const AppHeader(),
          actions: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.search),
            )
          ],
          titleSpacing: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const <Widget>[
              SpaceHeader(),
              SizedBox(height: 4),
              HorizontalScrollHeader(),
              SizedBox(height: 4),
              ListViewHome()
            ],
          ),
        ));
  }
}
