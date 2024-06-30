import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  Coord? coord;
  List<Weather>? weather;
  Main? main;
  String? name;

  WeatherResponse({this.coord, this.weather, this.main, this.name});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

@JsonSerializable()
class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Main {
  double? temp;
  double? feels_like;
  double? temp_min;
  double? temp_max;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}
