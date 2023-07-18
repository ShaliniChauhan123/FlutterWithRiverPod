import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homeScreen/widgets/feed.dart';
import 'package:flutter_application_1/screens/homeScreen/widgets/toast.dart';
import 'package:flutter_application_1/utils/type_class.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({super.key});
  @override
  Widget build(BuildContext context) {
    final List<RenderList> articles = List.generate(
      20,
      (index) => RenderList(
          id: index,
          image: Image.asset('assets/ice.jpg'),
          title:
              'We have special offer exclusively for our community members. Use the code '),
    );
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        children: [
                          index == 0 ? const Toast() : Container(),
                          FeedWidget(articles: articles, index: index)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
