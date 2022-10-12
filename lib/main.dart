// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:get/get.dart';
import 'weather/controller/global_controller.dart';
import 'screen/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  await Hive.initFlutter();
  await Hive.openBox("Habit_Database");
  runApp(MyApp());
}

Color brandColor = const Color.fromARGB(255, 182, 191, 255);

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (
      lightColorScheme,
      darkColorScheme,
    ) {
      ColorScheme lightDynamic;
      ColorScheme darkDynamic;

      if (lightColorScheme != null && darkColorScheme != null) {
        lightDynamic = lightColorScheme.harmonized()..copyWith();
        darkDynamic = darkColorScheme.harmonized();
      } else {
        lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
        darkColorScheme = ColorScheme.fromSeed(
          seedColor: brandColor,
          brightness: Brightness.dark,
        );
      }

      return MaterialApp(
        theme: ThemeData(
          unselectedWidgetColor: Colors.black,
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      );
    });
  }
}
