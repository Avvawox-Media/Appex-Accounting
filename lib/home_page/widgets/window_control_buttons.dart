import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

const buttonColors = WindowButtonColors(
    iconNormal: Color(0x88FFFFFF),
    mouseOver: Color(0x990099FF),
    mouseDown: Color(0x550099FF),
    iconMouseOver: Color(0x88FFFFFF),
    iconMouseDown: Color(0xFF0099FF));

const closeButtonColors = WindowButtonColors(
    mouseOver: Color(0x66D32F2F),
    mouseDown: Color(0x66B71C1C),
    iconNormal: Color(0x88FFFFFF),
    iconMouseOver: Colors.white);

class WindowControlButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
