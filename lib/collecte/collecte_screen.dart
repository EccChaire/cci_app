import 'package:flutter/material.dart';


class CollectePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Center(
              child: Text("Bienvenue @nom @prenom, Merci pour ton collaboration", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              _buildcollecteButton()
          ],
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