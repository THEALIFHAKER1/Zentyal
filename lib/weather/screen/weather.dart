import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/global_controller.dart';
import '../widgets/comfort_level.dart';
import '../widgets/current_weather.dart';
import '../widgets/daily_data_forecast.dart';
import '../widgets/header_widget.dart';
import '../widgets/hourly_weather.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Obx(
        (() => globalController.checkloading().isTrue
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      color: Theme.of(context).colorScheme.primaryContainer,
                      height: 200.00,
                      width: 200.00,
                    ),
                    CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ],
                ),
              )
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const HeaderWidget(),
                    CurrentWeather(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather()),
                    HourlyWidgets(
                        weatherDataHourly:
                            globalController.getData().getHourlyWeather()),
                    DailyForecastWidget(
                        weatherDataDaily:
                            globalController.getData().getDailyWeather()),
                    const SizedBox(),
                    ComfortLevel(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather())
                  ],
                ),
              )),
      )),
    );
  }
}
