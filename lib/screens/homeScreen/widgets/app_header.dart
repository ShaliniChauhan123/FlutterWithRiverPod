import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        NewWidget(),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Image(
            image: AssetImage('assets/glue.jpeg'),
            width: 30,
            height: 30,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 16, 16),
          child: Text(
            'GLUE',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
