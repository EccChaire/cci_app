import 'package:flutter/material.dart';


class CollectePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Bienvenue @nom @prenom, Merci pour ton collaboration", style: TextStyle(fontWeight: FontWeight.bold)),
          ));
  }
  Widget _buildcollecteButton() {
    return ElevatedButton(
      child: const Text('Collecte'),
      onPressed: () {
    // Implement your navigation
      },
    );
  }
}