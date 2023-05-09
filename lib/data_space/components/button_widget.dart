


import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.buttonLable,
      required this.buttonOnClickFunction});

  final String buttonLable;
  final Function() buttonOnClickFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
            left: 10, top: 10), // set padding to move button to top left corner
        child: ElevatedButton(
          onPressed: buttonOnClickFunction,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(
                const Size(190, 50)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
          child: Text(buttonLable),
        ));
  }
}
