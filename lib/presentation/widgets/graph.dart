import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class WeatherTemeratureLineChart extends StatelessWidget {
  static const dontShow = AxisTitles(sideTitles: SideTitles(showTitles: false));
  final List<MeasurementDto> measurements;
  final bool flag;

  const WeatherTemeratureLineChart({
    super.key,
    required this.measurements,
    required this.flag,
  });

  static const double iconSize = 25;

  // final List<AssetImage> iconsAndValues = const [
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-1.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-2.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-3.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-4.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-5.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-6.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-7.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-8.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-9.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-10.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-11.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-12.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-13.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-14.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-15.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-16.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-17.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-18.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-19.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-20.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-21.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-22.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-23.png'),
  //   AssetImage(
  //       'assets/frosted_glass_weather_icons_dark_theme/WeatherIcon - 1-24.png')
  // ];

  @override
  Widget build(BuildContext context) {
    final List<List<FlSpot>> points = makePoints();
    final double maxTemp =
        points.map((i) => i.map((j) => j.y).reduce(max)).reduce(max);
    final double minTemp =
        points.map((i) => i.map((j) => j.y).reduce(min)).reduce(min);
    
    final List<LineChartBarData> lineBarsData = makeLineChartBarData(points);

    // var tooltipsOnBar = lineBarsData[0];

    return SingleChildScrollView(
      primary: false,
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: WeatherTemeratureLineChart.iconSize),
        child: ConstrainedBox(
          constraints:
              const BoxConstraints.expand(height: double.infinity, width: 1000),
          child: LineChart(
            LineChartData(
              backgroundColor: Colors.transparent,
              maxY: maxTemp + 20,
              minY: minTemp - 5,
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              // showingTooltipIndicators: showingTooltipOnSpots
              //     .map((i) => ShowingTooltipIndicators([
              //           LineBarSpot(
              //             tooltipsOnBar,
              //             lineBarsData.indexOf(tooltipsOnBar),
              //             tooltipsOnBar.spots[i],
              //           )
              //         ]))
              //     .toList(),
              lineBarsData: lineBarsData,
              titlesData: FlTitlesData(
                show: true,
                leftTitles: WeatherTemeratureLineChart.dontShow,
                rightTitles: WeatherTemeratureLineChart.dontShow,
                topTitles: WeatherTemeratureLineChart.dontShow,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    reservedSize: 45,
                    showTitles: true,
                    getTitlesWidget: getTitlesWidget,
                  ),
                ),
              ),
              lineTouchData: LineTouchData(
                enabled: true,
                handleBuiltInTouches: true,
                touchTooltipData: LineTouchTooltipData(
                  tooltipPadding: const EdgeInsets.all(0),
                  tooltipMargin: 10,
                  fitInsideVertically: true,
                  getTooltipColor: (touchedSpot) => Colors.transparent,
                  getTooltipItems: (List<LineBarSpot> touchedSpots) {
                    return touchedSpots
                        .asMap()
                        .entries
                        .map((entry) => LineTooltipItem(
                            '${determentText(entry.key)} ${entry.value.y}',
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      entry.value.bar.gradient?.colors.first ??
                                          entry.value.bar.color ??
                                          Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                )))
                        .toList();
                  },
                ),
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                  return spotIndexes
                      .map((index) => const TouchedSpotIndicatorData(
                            FlLine(color: Colors.transparent),
                            FlDotData(show: true),
                          ))
                      .toList();
                },
              ),
            ),
            curve: Curves.easeInSine,
          ),
        ),
      ),
    );
  }

  Widget getTitlesWidget(double value, TitleMeta meta) {
    // AssetImage image = iconsAndValues[value.toInt()];
    int now = DateTime.now().hour;
    int calculateValue =
        DateTime.now().add(Duration(hours: value.truncate())).hour;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Image(
        //   image: image,
        //   alignment: Alignment.center,
        //   height: iconSize,
        //   width: iconSize,
        // ),
        Text(calculateValue == now ? 'Now' : '${calculateValue.toString()}:00'),
      ],
    );
  }

  Color? lerpGradient(List<Color> colors, List<double> stops, double temp,
      double maxGrad, double minGrad) {
    final normalize = (temp - minGrad) / (maxGrad - minGrad);
    final double t = normalize < 0.0
        ? 0.0
        : normalize > 1.0
            ? 1.0
            : normalize;
    for (var s = 0; s < stops.length - 1; s++) {
      final leftStop = stops[s], rightStop = stops[s + 1];
      final leftColor = colors[s], rightColor = colors[s + 1];
      if (t <= leftStop) {
        return leftColor;
      } else if (t < rightStop) {
        final sectionT = (t - leftStop) / (rightStop - leftStop);
        return Color.lerp(leftColor, rightColor, sectionT);
      }
    }
    return colors.last;
  }

  List<Color> getGradientColors(double minTemp, double maxTemp, index) {
    final colors = [
      Colors.blue.shade900,
      Colors.green,
      Colors.yellow,
      Colors.red,
      Colors.deepPurple,
    ];
    const stops = [0.10, 0.25, 0.45, 0.70, 0.90];

    double maxGrad = 600;
    double minGrad = 0;

    if (flag) {
      maxGrad = 15400;
    } else {
      switch (index) {
        case 0:
          maxGrad = 5;
        case 1:
          maxGrad = 200;
        case 2:
          maxGrad = 75;
        case 3:
          maxGrad = 350;
      }
    }

    Color? minColor = lerpGradient(colors, stops, minTemp, maxGrad, minGrad);

    Color? maxColor = lerpGradient(colors, stops, maxTemp, maxGrad, minGrad);

    return [minColor ?? Colors.blue, maxColor ?? Colors.red];
  }

  List<LineChartBarData> makeLineChartBarData(List<List<FlSpot>> points) {
    List<LineChartBarData> lineBarsData = [];
    int i = 0;
    for (var measurement in points) {
      final double maxTemp = measurement.map((e) => e.y).reduce(max);
      final double minTemp = measurement.map((e) => e.y).reduce(min);

      lineBarsData.add(
        LineChartBarData(
          spots: measurement,
          isCurved: true,
          dotData: const FlDotData(show: false),
          gradient: LinearGradient(
            colors: getGradientColors(minTemp, maxTemp, i),
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      );
      i += 1;
    }
    return lineBarsData;
  }

  List<List<FlSpot>> makePoints() {
    List<List<FlSpot>> points = [];
    if (flag) {
      points.add(measurements
          .asMap()
          .entries
          .map((m) => FlSpot(m.key.toDouble(), m.value.co ?? 0.0))
          .toList());
    } else {
      points.add(measurements
          .asMap()
          .entries
          .map((m) => FlSpot(m.key.toDouble(), m.value.aqi ?? 0.0))
          .toList());
      points.add(measurements
          .asMap()
          .entries
          .map((m) => FlSpot(m.key.toDouble(), m.value.pM10 ?? 0.0))
          .toList());
      points.add(measurements
          .asMap()
          .entries
          .map((m) => FlSpot(m.key.toDouble(), m.value.pM25 ?? 0.0))
          .toList());
      points.add(measurements
          .asMap()
          .entries
          .map((m) => FlSpot(m.key.toDouble(), m.value.sO2 ?? 0.0))
          .toList());
    }
    return points;
  }

  String determentText(index) {
    if (flag) {
      return 'CO';
    } else {
      switch (index) {
        case 0:
          return 'AQI';
        case 1:
          return 'PM 10';
        case 2:
          return 'PM 2.5';
        case 3:
          return 'SO2';
        default:
          return '';
      }
    }
  }
}
