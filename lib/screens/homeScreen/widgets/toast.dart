import 'package:flutter/material.dart';

class Toast extends StatelessWidget {
  const Toast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 231, 232, 234),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.info_outlined,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Text(
                'Highlights will disappear after 30 days of posting',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
