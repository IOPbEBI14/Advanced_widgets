class WeatherState {
  late final double weatherValue;
  late final double sunValue;
  late final double cloudValue;
  late final double rainValue;

  WeatherState(
      {required this.weatherValue,
      required this.sunValue,
      required this.cloudValue,
      required this.rainValue});

  WeatherState.setWeather(double value) {
    weatherValue = value;
    sunValue = _getSunState(value);
    cloudValue = _getCloudState(value);
    rainValue = _getRainState(value);
  }

  double _getSunState(double value) {
    if (value < 0.5) return 1;
    if (value >= 0.7) return 0;

    return -5 * value + 3.5;
  }

  double _getCloudState(double value) {
    if (value < 0.3) return 0;

    return 10 / 7 * value - 3 / 7;
  }

  double _getRainState(double value) {
    if (value < 0.7) {
      return 0;
    }

    return 10 / 3 * value - 7 / 3;
  }
}
