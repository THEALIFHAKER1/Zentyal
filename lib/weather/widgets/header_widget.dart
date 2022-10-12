import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "City";
  String date = DateFormat("EEEE, MMM d, yyyy, h:mm a").format(DateTime.now());
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  void initState() {
    getAddress(globalController.getlattitude().value,
        globalController.getlongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemarks[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(
                        right: 20.00, bottom: 20, top: 20),
                    alignment: Alignment.topLeft,
                    child: Container(
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            city,
                            style: const TextStyle(
                                fontSize: 50.00, fontWeight: FontWeight.bold),
                          ),
                        )))),
            Container(
              margin: const EdgeInsets.only(right: 10.00),
              child: Image.asset(
                color: Theme.of(context).colorScheme.primaryContainer,
                "assets/logo.png",
                height: 100,
                width: 100,
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(right: 20.00, bottom: 20.00),
          alignment: Alignment.topLeft,
          child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(date,
                  style: const TextStyle(fontSize: 15.00, height: 1.50))),
        ),
      ],
    );
  }
}
