import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'progress_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/weather-forecast(5).png', height: 150),
            SizedBox(height: 20),
            Text(
              'Météo Expresso',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ProgressScreen());
              },
              child: Text('Commencer'),
            ),
          ],
        ),
      ),
    );
  }
}
