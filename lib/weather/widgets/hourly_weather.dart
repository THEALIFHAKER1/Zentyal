import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/global_controller.dart';
import '../model/weather_data_hourly.dart';
import '../widgets/hourly_details.dart';

class HourlyWidgets extends StatefulWidget {
  final WeatherDataHourly weatherDataHourly;
  const HourlyWidgets({super.key, required this.weatherDataHourly});

  @override
  State<HourlyWidgets> createState() => _HourlyWidgetsState();
}

class _HourlyWidgetsState extends State<HourlyWidgets> {
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.00, horizontal: 20.00),
          alignment: Alignment.topCenter,
          child: const Text(
            "Today",
            style: TextStyle(
              fontSize: 18.00,
            ),
          ),
        ),
        Container(
          height: 170.00,
          padding: const EdgeInsets.only(
            top: 10.00,
            bottom: 10.00,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.weatherDataHourly.hourly.length > 12
                ? 12
                : widget.weatherDataHourly.hourly.length,
            itemBuilder: (context, index) {
              return Obx((() => GestureDetector(
                  onTap: () {
                    cardIndex.value = index;
                    {}
                  },
                  child: Container(
                    width: 90.00,
                    margin: const EdgeInsets.only(left: 20.00, right: 5.00),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.00),
                      color: cardIndex.value == index
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                    ),
                    child: HourlyDetalis(
                        index: index,
                        cardIndex: cardIndex.toInt(),
                        temp: widget.weatherDataHourly.hourly[index].temp!,
                        timeStamps: widget.weatherDataHourly.hourly[index].dt!,
                        weatherIcon: widget
                            .weatherDataHourly.hourly[index].weather![0].icon!),
                  ))));
            },
          ),
        )
      ],
    );
  }
}
