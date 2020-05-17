import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String API_KEY = '43676844749ed52e3d055c6df3a28942';
const String OPEN_WEATHER_MAP_URL =
    'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url =
        '${OPEN_WEATHER_MAP_URL}lat=${location.latitude}&lon=${location.longitude}&&units=metric&appid=$API_KEY';

    NetworkingApi networkingApi = NetworkingApi(url);
    var weatherData = await networkingApi.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
