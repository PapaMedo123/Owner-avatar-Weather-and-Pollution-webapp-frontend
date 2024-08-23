import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/api.dart';
import 'package:weather_application_frontend/logic/bloc/cubit/current_measurement_cubit.dart';
import 'package:weather_application_frontend/presentation/screen/background_image.dart';
import 'package:weather_application_frontend/presentation/widgets/app_bar_title.dart';
import 'package:weather_application_frontend/presentation/widgets/app_wrapper.dart';
import 'package:weather_application_frontend/presentation/widgets/graph.dart';
import 'package:weather_application_frontend/presentation/widgets/polution_wiget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});
  final ScrollController _controller = ScrollController();

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  Color barBackgroundColor = Colors.transparent;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<StationCubit>().fetchLocationMeasurement();
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<StationCubit>().fetchLocationMeasurement();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double collapsedBarHeight = 60;
    const double expandedBarHeight = 200;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const BackgroundImage(),
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              double offset = widget._controller.offset;
              bool isCollapsed = widget._controller.hasClients &&
                  offset > (expandedBarHeight - collapsedBarHeight);
              double size = (expandedBarHeight - collapsedBarHeight) - offset;
              double opacity = size < (expandedBarHeight * 0.5)
                  ? 1 - size / (expandedBarHeight * 0.5)
                  : 0;
              setState(() {
                barBackgroundColor = isCollapsed
                    ? Theme.of(context).canvasColor
                    : Theme.of(context).canvasColor.withOpacity(opacity);
              });
              return false;
            },
            child: RefreshIndicator(
              onRefresh: () async =>
                  context.read<StationCubit>().fetchLocationMeasurement(),
              child: CustomScrollView(
                controller: widget._controller,
                slivers: [
                  SliverAppBar(
                    backgroundColor: barBackgroundColor,
                    surfaceTintColor: Colors.transparent,
                    pinned: true,
                    primary: true,
                    stretch: true,
                    expandedHeight: expandedBarHeight,
                    collapsedHeight: collapsedBarHeight,
                    centerTitle: true,
                    flexibleSpace: FlexibleSpaceBar(
                      expandedTitleScale: 1.5,
                      centerTitle: true,
                      titlePadding: const EdgeInsets.symmetric(vertical: 5),
                      title: const AppBarTitle(),
                      background: Container(color: Colors.transparent),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: AppWrapper(
                        height: 350,
                        width: double.infinity,
                        padding: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('24 hour forecast'),
                            Expanded(
                              child: BlocBuilder<StationCubit, StationState>(
                                builder: (context, state) {
                                  final measurements =
                                      state.stationDto?.measurements;
                                  if (measurements == null) {
                                    return const LinearProgressIndicator(
                                      backgroundColor: Colors.transparent,
                                    );
                                  }
                                  return WeatherTemeratureLineChart(
                                    flag: false,
                                    measurements: measurements,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppWrapper(
                        height: 250,
                        width: double.infinity,
                        padding: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('24 hour forecast'),
                            Expanded(
                              child: BlocBuilder<StationCubit, StationState>(
                                builder: (context, state) {
                                  final measurements =
                                      state.stationDto?.measurements;
                                  if (measurements == null) {
                                    return const LinearProgressIndicator(
                                      backgroundColor: Colors.transparent,
                                    );
                                  }
                                  return WeatherTemeratureLineChart(
                                    flag: true,
                                    measurements: measurements,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    sliver: BlocBuilder<StationCubit, StationState>(
                      builder: (context, state) {
                        final MeasurementDto? currentMeasurements =
                            state.stationDto?.measurements?.first;

                        final double aqi =
                            (currentMeasurements?.aqi ?? 0.0 - 0) / (5 - 0);
                        final double co =
                            (currentMeasurements?.co ?? 0.0 - 0) / (15400 - 0);
                        final double pM10 =
                            (currentMeasurements?.pM10 ?? 0.0 - 0) / (200 - 0);
                        final double pM25 =
                            (currentMeasurements?.pM25 ?? 0.0 - 0) / (75 - 0);
                        final double sO2 =
                            (currentMeasurements?.sO2 ?? 0.0 - 0) / (350 - 0);

                        return SliverGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: [
                            PolutionWiget(
                              title: 'AQI',
                              textValue: '${currentMeasurements?.aqi ?? '-'}',
                              value: aqi,
                            ),
                            PolutionWiget(
                              title: 'CO',
                              textValue: '${currentMeasurements?.co ?? '-'}',
                              number: true,
                              value: co,
                            ),
                            PolutionWiget(
                              title: 'PM 10',
                              textValue: '${currentMeasurements?.pM10 ?? '-'}',
                              number: true,
                              value: pM10,
                            ),
                            PolutionWiget(
                              title: 'PM 2.5',
                              textValue: '${currentMeasurements?.pM25 ?? '-'}',
                              number: true,
                              value: pM25,
                            ),
                            PolutionWiget(
                              title: 'SO2',
                              textValue: '${currentMeasurements?.sO2 ?? '-'}',
                              number: true,
                              value: sO2,
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
