import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homeScreen/widgets/reaction_widget.dart';
import 'package:flutter_application_1/utils/type_class.dart';

class FeedWidget extends StatelessWidget {
  final List<RenderList> articles;
  final int index;
  const FeedWidget({required this.articles, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 238, 238, 238)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 10,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 35, 48, 227),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '28 March',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 159, 153, 153)),
                  ),
                  Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  image: AssetImage('assets/ice.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      text: articles[index].title,
                      children: const <TextSpan>[
                        TextSpan(
                            text: '"SUMMERDELIGHTS"',
                            style: TextStyle(
                                color: Color.fromARGB(255, 76, 162, 79),
                                fontWeight: FontWeight.bold))
                      ]),
                )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 20.0,
                        ),
                        Text(
                          '12k',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                    Text('84 comments',
                        style: TextStyle(fontSize: 12, color: Colors.grey))
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_outline,
                          color: Colors.grey,
                          size: 24.0,
                        ),
                        Text(
                          'Like',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                    EmojiPopUpMenuButton(),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: const DecorationImage(
                            image: AssetImage('assets/ice.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Write your comment',
                              hintStyle: const TextStyle(color: Colors.grey),
                              contentPadding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 6, bottom: 6),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey)))),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
