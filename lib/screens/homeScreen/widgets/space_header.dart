import 'package:flutter/material.dart';

class SpaceHeader extends StatelessWidget {
  const SpaceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const SizedBox(
                            height: 30.0,
                            width: 30.0,
                            child: Image(
                              image: AssetImage('assets/starBucks.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        'Starbucks',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          border: Border.all(
                            color: Colors.redAccent,
                          )),
                      child: TextButton(
                          // ignore: avoid_print
                          onPressed: () => print('ddd'),
                          child: const Text(
                            'Invite',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                  ],
                ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
