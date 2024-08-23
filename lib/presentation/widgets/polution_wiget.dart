import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:weather_application_frontend/presentation/widgets/app_wrapper.dart';

class PolutionWiget extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final String textValue;
  final double value;
  final bool? number;

  const PolutionWiget({
    super.key,
    this.height,
    this.width,
    required this.title,
    required this.value,
    required this.textValue,
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(
            color: Theme.of(context)
                .textTheme
                .titleMedium
                ?.color
                ?.withOpacity(0.5));
    final TextStyle? titleValueStyle = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontWeight: FontWeight.bold);
    final TextStyle? valueStyle = Theme.of(context)
        .textTheme
        .displayMedium
        ?.copyWith(color: Color.lerp(Colors.green, Colors.red, value));

    return AppWrapper(
      padding: 20,
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleStyle,
                  ),
                  (number != null && number == true)
                      ? Container()
                      : Text(
                          textValue,
                          style: titleValueStyle,
                        ),
                ],
              )),
          Positioned(
            bottom: 0,
            right: 0,
            child: (number != null && number == true)
                ? Text(
                    textValue,
                    style: valueStyle,
                  )
                : RadialGauge(
                    radius: 35,
                    value: value,
                    axis: const GaugeAxis(
                      style: GaugeAxisStyle(
                        thickness: 10,
                      ),
                      degrees: 270,
                      pointer: GaugePointer.needle(
                        width: 10,
                        height: 25,
                        color: Colors.grey,
                      ),
                      progressBar: GaugeProgressBar.rounded(
                        gradient: GaugeAxisGradient(
                          colors: [Colors.green, Colors.yellow, Colors.red],
                          colorStops: [0.25, 0.5, 0.75],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
