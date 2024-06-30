import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:weather_app/controller/weather_controller.dart';

class ProgressScreen extends StatelessWidget {
  final WeatherController controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('Météo'),
      ),
      body: Obx(() {
        if (controller.progress.value >= 1.0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.weatherData.length,
                  itemBuilder: (context, index) {
                    var weather = controller.weatherData[index];
                    return ListTile(
                      title: Text(weather.cityName),
                      subtitle: Row(
                        children: [
                          Text('Température: ${weather.temperature}°C'),
                          SizedBox(width: 10),
                          Icon(Icons.cloud),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.reset();
                },
                child: Text('Recommencer'),
              ),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(controller.currentMessage.value),
              SizedBox(height: 20),
              ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 40,
              lineHeight: 20,
                percent: controller.progress.value,
                backgroundColor: Colors.white,
                progressColor: Colors.black54,
                center: Text(
                  '${(controller.progress.value * 100).toStringAsFixed(1)}%',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
            ],
          );
        }
      }),
    );
  }
}
