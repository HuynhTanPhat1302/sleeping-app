import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class SwipeUpButton extends StatefulWidget {
  final VoidCallback onPressed;

  SwipeUpButton({required this.onPressed});

  @override
  _SwipeUpButtonState createState() => _SwipeUpButtonState();
}

class _SwipeUpButtonState extends State<SwipeUpButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, 1),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        _controller.value -= details.primaryDelta! / context.size!.height;
      },
      onVerticalDragEnd: (details) {
        if (_controller.value > 0.5) {
          _controller.forward();
          widget.onPressed();
        } else {
          _controller.reverse();
        }
      },
      child: SlideTransition(
        position: _animation,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: Icon(Icons.arrow_upward, color: Colors.white),
        ),
      ),
    );
  }
}
