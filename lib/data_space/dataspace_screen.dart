import 'package:cci_app/quizz1/quizz_screen.dart';
import 'package:cci_app/quizz3/quizz_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cci_app/quizz2/quizz_screen.dart';


class DataSpace extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          children:  [
            Row(
                children: [
                  Column(
                      children:  [
                        _buildQuizz1(),
                      ]
                  ),
                  Column(
                      children:[
                        _buildQuizz2(),
                      ]
                  )]),
            Row(
                children: [
                  Column(
                      children:  [
                        _buildQuizz3(),
                      ]
                  ),
                  Column(
                      children:[
                        _buildQuizz4(),
                      ]
                  )]),
            Row(
                children: [
                  Column(
                      children:  [
                        _buildcam(),
                      ]
                  ),
                  Column(
                      children:[
                        _buildmicro(),
                      ]
                  )]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildsent()
                  ]),

          ],
        ));
  }
  Widget _buildQuizz1() {
    return Container(
        padding: EdgeInsets.only(left: 10, top: 40), // set padding to move button to top left corner
        child:ElevatedButton(
          child: const Text('Quizz1'),
          onPressed: () {
            Get.to(() => Q1Page());
        // Implement your navigation
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(Size(190, 250)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
        ));
  }
  Widget _buildQuizz2() {
    return Container(
        padding: EdgeInsets.only(left: 10, top: 40), // set padding to move button to top left corner
        child:ElevatedButton(
          child: const Text('Quizz2'),
            onPressed: () {
              Get.to(() => Q2Page());
        // Implement your navigation
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(Size(190, 250)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
        ));
  }
  Widget _buildQuizz3() {
    return Container(
        padding: EdgeInsets.only(left: 10, top: 10), // set padding to move button to top left corner
        child: ElevatedButton(
          child: const Text('Quizz3'),
          onPressed: () {
            Get.to(() => Q3Page());
          // Implement your navigation
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(Size(190, 250)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
        ));
    }
  Widget _buildQuizz4() {
    return Container(
        padding: EdgeInsets.only(left: 10, top: 10), // set padding to move button to top left corner
        child:ElevatedButton(
          child: const Text('Quizz4'),
          onPressed: () {
          // Implement your navigation
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(Size(190, 250)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
        ));
  }
  Widget _buildcam() {
    return Container(
        padding: EdgeInsets.only(left: 10, top: 10), // set padding to move button to top left corner
        child:ElevatedButton(
          child: const Text('Camera'),
          onPressed: () {
          // Implement your navigation
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(Size(190, 50)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
        ));
  }
  Widget _buildmicro() {
    return Container(
        padding: EdgeInsets.only(left: 10, top: 10), // set padding to move button to top left corner
        child:ElevatedButton(
          child: const Text('micro'),
          onPressed: () {
          // Implement your navigation
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(Size(190, 50)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
          ));
  }
  Widget _buildsent() {
    return Container(
        padding: EdgeInsets.only(left: 10, top: 10), // set padding to move button to top left corner
        child: ElevatedButton(
          child: const Text('Envoyer'),
          onPressed: () {
          // Implement your navigation
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
        ));
  }
}