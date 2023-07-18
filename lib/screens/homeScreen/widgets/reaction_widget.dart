import 'package:flutter/material.dart';

class EmojiPopUpMenuButton extends StatelessWidget {
  const EmojiPopUpMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      constraints: const BoxConstraints(),
      color: Colors.white,
      offset: const Offset(0, -25),
      surfaceTintColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: const Icon(
        Icons.emoji_emotions_outlined,
        color: Colors.grey,
      ),
      itemBuilder: (context) => [
        const PopupMenuWidget(
          height: 15,
          child: Row(
            children: [
              PopupMenuItem(
                padding: EdgeInsets.only(bottom: 6, left: 8),
                child: Text(
                  '😍',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              PopupMenuItem(
                padding: EdgeInsets.only(bottom: 6, left: 8),
                child: Text(
                  '😂',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              PopupMenuItem(
                padding: EdgeInsets.only(bottom: 6, left: 8),
                child: Text(
                  '👏',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              PopupMenuItem(
                padding: EdgeInsets.only(bottom: 6, left: 8),
                child: Text(
                  '💯',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              PopupMenuItem(
                padding: EdgeInsets.only(bottom: 6, left: 8),
                child: Text(
                  '😭',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PopupMenuWidget<T> extends PopupMenuEntry<T> {
  final Widget child;

  const PopupMenuWidget({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  final double height;

  @override
  PopupMenuWidgetState createState() => PopupMenuWidgetState();

  @override
  bool represents(T? value) => false;
}

class PopupMenuWidgetState extends State<PopupMenuWidget> {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 20),
        height: 30,
        color: Colors.transparent,
        child: widget.child,
      );
}
