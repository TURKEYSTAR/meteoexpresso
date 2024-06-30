import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/api/weather_response.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5")
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio, {String baseUrl}) = _WeatherApiClient;

  @GET("/weather")
  Future<WeatherResponse> getWeather(
      @Query("q") String cityName,
      @Query("appid") String apiKey,
      @Query("units") String units,
      );
}
