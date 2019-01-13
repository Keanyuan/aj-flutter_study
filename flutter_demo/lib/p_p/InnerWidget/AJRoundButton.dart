
import 'package:flutter/material.dart';

///圆角按钮
class AJRoundButton extends StatefulWidget {
  static const defaultBackgroundColor = const Color(0xFF8B5FFE);
  static const defaultActiveBackgroundColor = const Color(0xB38B5FFE);
  static const defaultDisabledBackgroundColor = const Color(0x338B5FFE);

  AJRoundButton({
    this.title,
    this.onPress,
    this.height = 52.0,
    this.width = double.infinity,
    this.disabled = false,
    this.backgroundColor = defaultBackgroundColor,
    this.activeBackgroundColor = defaultActiveBackgroundColor,
    this.disabledBackgroundColor = defaultDisabledBackgroundColor,
  });

  final Widget title;
  final Color backgroundColor, activeBackgroundColor, disabledBackgroundColor;
  final VoidCallback onPress;
  final double height, width;
  final bool disabled;

  @override
  State<StatefulWidget> createState() {
    return _AJRoundButtonState();
  }
}

class _AJRoundButtonState extends State<AJRoundButton> {
  Color currentColor;

  @override
  void initState() {
    super.initState();
    if (widget.disabled) {
      currentColor = widget.disabledBackgroundColor;
    } else {
      currentColor = widget.backgroundColor;
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    currentColor = widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        if (widget.onPress != null && !widget.disabled) {
          widget.onPress();
        }
      },
      onTapDown: (TapDownDetails details) {
        if (!widget.disabled) {
          setState(() {
            currentColor = widget.activeBackgroundColor;
          });
        }
      },
      onTapUp: (TapUpDetails details) {
        if (!widget.disabled) {
          setState(() {
            currentColor = widget.backgroundColor;
          });
        }
      },
      onTapCancel: () {
        if (!widget.disabled) {
          setState(() {
            currentColor = widget.backgroundColor;
          });
        }
      },
      child: new Container(
        decoration: new BoxDecoration(
          color: currentColor,
          borderRadius:
          new BorderRadius.all(new Radius.circular(widget.height / 2.0)),
        ),
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        child: widget.title,
      ),
    );
  }
}