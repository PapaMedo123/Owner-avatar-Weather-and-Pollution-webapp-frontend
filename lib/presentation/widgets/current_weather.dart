import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  final String city = 'Brixen';
  final String currentTemp = '25\u00b0';
  final String status = 'Clear';
  final String highTemp = '31\u00b0';
  final String lowTemp = '19\u00b0';
  final String aqi = '24';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      // child: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Text(
      //       ' $currentTemp',
      //       style: const TextStyle(
      //         height: 0.8,
      //         fontSize: 100,
      //         fontWeight: FontWeight.w400,
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 16,
      //     ),
      //     Text('$status $highTemp/$lowTemp',
      //         style: Theme.of(context).textTheme.titleLarge),
      //     const SizedBox(
      //       height: 16,
      //     ),
      //     RichText(
      //         text: TextSpan(
      //       children: [
      //         WidgetSpan(
      //             child: Icon(
      //           Icons.eco,
      //           size: Theme.of(context).textTheme.titleLarge!.fontSize,
      //         )),
      //         TextSpan(
      //             text: ' AQI $aqi',
      //             style: Theme.of(context).textTheme.titleLarge),
      //       ],
      //     )),
      //   ],
      // ),
    );
  }
}
