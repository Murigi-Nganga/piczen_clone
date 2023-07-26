class Weather {

  final double temp;
  final double pressure;
  final double humidity;
  
  Weather({
    required this.temp,
    required this.pressure,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
      temp: json['temp'] as double,
      pressure: json['pressure'] as double,
      humidity: json['humidity'] as double);
}
