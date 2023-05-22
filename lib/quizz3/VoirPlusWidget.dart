import 'package:flutter/material.dart';

class VoirPlusWidget extends StatefulWidget {
  final String description;
  final int limite;

  const VoirPlusWidget({required this.description, required this.limite});

  @override
  _VoirPlusWidgetState createState() => _VoirPlusWidgetState();
}

class _VoirPlusWidgetState extends State<VoirPlusWidget> {
  bool afficherDescriptionComplete = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          (afficherDescriptionComplete || widget.description.length <= widget.limite)
              ? widget.description
              : widget.description.substring(0, widget.limite) + '...',
        ),
        if (!afficherDescriptionComplete && widget.description.length > widget.limite)
          TextButton(
            onPressed: () {
              setState(() {
                afficherDescriptionComplete = true;
              });
            },
            child: Text('Voir plus'),
          ),
      ],
    );
  }
}
