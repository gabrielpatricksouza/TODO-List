import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  final double height;
  final double widhtMultiply;
  final String text;
  final IconData? icon;
  final bool? iconBool;
  final Color? color;
  final Function? onTap;


  CustomAnimatedButton(
      {
        required this.widhtMultiply,
        this.height = 60,
        this.text   = "",
        this.icon,
        this.color,
        this.onTap,
        this.iconBool
      });

  @override
  _CustomAnimatedButtonState createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return Center(
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTap: (){
          widget.onTap!();
        },
        child: Transform.scale(
          scale: _scale,
          child: _animatedButtonUI,
        ),
      ),
    );
  }

  Widget get _animatedButtonUI => Material(
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    child: Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width * widget.widhtMultiply,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: widget.color == null
            ? Colors.blue
            : widget.color
      ),
      child: Center(
        child: widget.iconBool == true
          ? Icon(widget.icon, color: Colors.white, size: 40,)
          : Text(
            widget.text,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
        ),
      ),
    ),
  );

}