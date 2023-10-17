class Weather {
  Weather({
    required this.temp,
    required this.pressure,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        temp: double.parse(json['temp'].toString()),
        pressure: double.parse(json['pressure'].toString()),
        humidity: double.parse(json['humidity'].toString()),
      );

  final double temp;
  final double pressure;
  final double humidity;
}
