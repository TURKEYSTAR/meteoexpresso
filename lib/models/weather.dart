import 'package:flutter/material.dart';

class Weather {
  final String cityName;
  final double temperature;
  final String cloudCoverageIcon;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.cloudCoverageIcon,
  });
}
