import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application_frontend/logic/bloc/cubit/current_measurement_cubit.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      maintainBottomViewPadding: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<StationCubit, StationState>(
            builder: (context, state) {
              final String? cityName = state.stationDto?.cityName;
              final String? stationName = state.stationDto?.stationName;
              if (cityName == null || stationName == null) {
                return const CircularProgressIndicator.adaptive();
              }
              return Text('$cityName, $stationName',
                  style: Theme.of(context).textTheme.titleLarge);
            },
          ),
        ],
      ),
    );
  }
}
