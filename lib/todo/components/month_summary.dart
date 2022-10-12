import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import '../datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12)),
        ),
        child: HeatMap(
          startDate: createDateTimeObject(startDate),
          // ignore: prefer_const_constructors
          endDate: DateTime.now().add(Duration(days: 0)),
          datasets: datasets,
          colorMode: ColorMode.color,
          showColorTip: false,
          showText: true,
          scrollable: true,
          size: 30,
          colorsets: {
            1: Theme.of(context).colorScheme.primaryContainer.withAlpha(20),
            2: Theme.of(context).colorScheme.primaryContainer.withAlpha(40),
            3: Theme.of(context).colorScheme.primaryContainer.withAlpha(60),
            4: Theme.of(context).colorScheme.primaryContainer.withAlpha(80),
            5: Theme.of(context).colorScheme.primaryContainer.withAlpha(100),
            6: Theme.of(context).colorScheme.primaryContainer.withAlpha(120),
            7: Theme.of(context).colorScheme.primaryContainer.withAlpha(140),
            8: Theme.of(context).colorScheme.primaryContainer.withAlpha(160),
            9: Theme.of(context).colorScheme.primaryContainer.withAlpha(180),
            10: Theme.of(context).colorScheme.primaryContainer.withAlpha(255),
          },
          onClick: (value) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(value.toString())));
          },
        ),
      ),
    );
  }
}
