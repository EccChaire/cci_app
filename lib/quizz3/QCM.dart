import 'package:flutter/material.dart';



class ChooseTwoInOrderQuestion extends StatefulWidget {
  final String question;

  ChooseTwoInOrderQuestion({required this.question});

  @override
  _ChooseTwoInOrderQuestionState createState() => _ChooseTwoInOrderQuestionState();
}

class _ChooseTwoInOrderQuestionState extends State<ChooseTwoInOrderQuestion> {
  List<String> options = [    'Option 1',    'Option 2',    'Option 3',    'Option 4',  ];
  List<String> selectedOptions = ['', ''];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.question),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(options[index]),
              selected: selectedOptions.contains(options[index]),
              onTap: () {
                setState(() {
                  if (selectedOptions[0] == '') {
                    selectedOptions[0] = options[index];
                  } else if (selectedOptions[1] == '') {
                    selectedOptions[1] = options[index];
                  } else {
                    selectedOptions[0] = selectedOptions[1];
                    selectedOptions[1] = options[index];
                  }
                });
              },
            );
          },
        ),
        SizedBox(height: 10),
        Text('Selected options: ${selectedOptions[0]}, ${selectedOptions[1]}'),
      ],
    );
  }
}
