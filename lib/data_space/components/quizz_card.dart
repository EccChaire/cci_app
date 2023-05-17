


import 'package:flutter/material.dart';

class QuizzCard extends StatelessWidget {
  const QuizzCard(
      {super.key, required this.cardTitle, required this.onClockFuction});

  final String cardTitle;
  final Function() onClockFuction;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
            left: 10, top: 10), // set padding to move button to top left corner
        child: ElevatedButton(
          onPressed: onClockFuction,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(
                const Size(190, 250)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
          child: Text(cardTitle),
        ));
  }
}
