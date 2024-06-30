import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import '../models/weather.dart' as model;
import '../api/weather_api.dart';
import '../api/weather_response.dart' as api;

class WeatherController extends GetxController {
  var currentMessage = 'Nous téléchargeons les données...'.obs;
  var progress = 0.0.obs;
  var jaugeRemplie = false.obs;

  List<model.Weather> weatherData = [];
  final WeatherApiClient _apiClient = WeatherApiClient(Dio());

  List<String> messages = [
    'Nous téléchargeons les données...',
    'C\'est presque fini...',
    'Plus que quelques secondes avant d\'avoir le résultat...',
  ];
  Timer? _timer;
  Timer? _messageTimer;

  @override
  void onInit() {
    super.onInit();
    _startProgress();
    _startMessageRotation();
  }

  void _startProgress() {
    const totalSeconds = 60;
    const updateInterval = Duration(seconds: 1);
    int elapsedSeconds = 0;

    _timer = Timer.periodic(updateInterval, (timer) {
      progress.value = (elapsedSeconds / totalSeconds).clamp(0.0, 1.0);
      elapsedSeconds++;

      if (elapsedSeconds > totalSeconds) {
        _timer?.cancel();
        jaugeRemplie.value = true;
        fetchWeatherData();
      }
    });
  }

  void _startMessageRotation() {
    int messageIndex = 0;
    const rotationInterval = Duration(seconds: 6);

    _messageTimer = Timer.periodic(rotationInterval, (timer) {
      currentMessage.value = messages[messageIndex];
      messageIndex = (messageIndex + 1) % messages.length;
    });
  }

  void reset() {
    progress.value = 0.0;
    currentMessage.value = messages[0];
    jaugeRemplie.value = false;
    _startProgress();
    _startMessageRotation();
  }

  void fetchWeatherData() async {
    try {
      List<String> cities = ["Paris", "London", "New York", "Tokyo", "Sydney"];
      weatherData.clear();

      for (String city in cities) {
        api.WeatherResponse response = await _apiClient.getWeather(city, "6510868cd7cd9d51a856e70e390a5ab9", "metric");
        weatherData.add(model.Weather(
          cityName: response.name ?? "Unknown",
          temperature: response.main?.temp ?? 0.0,
          cloudCoverageIcon: response.weather?.first.icon ?? "unknown",
        ));
      }

      currentMessage.value = "Données chargées";
    } catch (e) {
      print("Erreur lors de la récupération des données météo: $e");
      currentMessage.value = "Erreur lors de la récupération des données météo.";
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    _messageTimer?.cancel();
    super.onClose();
  }
}
