import 'package:flutter/material.dart';

class MetricInterface extends StatefulWidget {
  final String question;

  MetricInterface({required this.question});

  @override
  _MetricInterfaceState createState() => _MetricInterfaceState();
}

class _MetricInterfaceState extends State<MetricInterface> {
  double _currentValue = 3.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30,right:30, top: 20),
        width: 400,
        height: 130,
        decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        ),
        child :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children : [
                Column(
                  children : [
                    Text(widget.question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Note: $_currentValue', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ]
                ),
                Column(
                  children:[
                    SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 5,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                        ),
                        child: Slider(
                          value: _currentValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          activeColor: Colors.green,
                          inactiveColor: Colors.white,

                          onChanged: (double value) {
                            setState(() {
                             _currentValue = value;
                        });
                      },
              ))]
          )]
        )],
    )
    );
  }
}

