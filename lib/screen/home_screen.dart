import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iot_app/screen/about_screen.dart';
import 'package:iot_app/components/card.dart';
import 'package:iot_app/components/drawer.dart';
import 'package:iot_app/components/stats_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final DraggableScrollableController _draggableController =
      DraggableScrollableController();
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  bool isExpanded = false;
  bool pumpStatus = false;
  int soilMoisture = 0;
  double humidity = 0.0;
  double temperature = 0.0;

  @override
  void initState() {
    super.initState();

    _draggableController.addListener(() {
      setState(() {
        isExpanded = _draggableController.size >= 0.6;
      });
    });

    // _databaseReference.child('control/pumpStatus').onValue.listen((event) {
    //   setState(() {
    //     pumpStatus = event.snapshot.value as bool;
    //   });
    // });

    _databaseReference.child('sensor/soilMoisture').onValue.listen((event) {
      setState(() {
        if (event.snapshot.value != null) {
          soilMoisture = int.tryParse(event.snapshot.value.toString()) ?? 0;
        } else {
          soilMoisture = 0;
        }
      });
    });

    _databaseReference.child('sensor/humidity').onValue.listen((event) {
      setState(() {
        if (event.snapshot.value != null) {
          humidity = double.tryParse(event.snapshot.value.toString()) ?? 0.0;
        } else {
          humidity = 0.0;
        }
      });
    });

    _databaseReference.child('sensor/temperature').onValue.listen((event) {
      setState(() {
        if (event.snapshot.value != null) {
          temperature = double.tryParse(event.snapshot.value.toString()) ?? 0.0;
        } else {
          temperature = 0.0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MyDrawer(),
      backgroundColor: const Color.fromARGB(255, 239, 250, 225),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 250, 225),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF006769), Color(0xFF40A578)],
              tileMode: TileMode.mirror,
            ).createShader(bounds),
            child: GestureDetector(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
              child: const Icon(
                FontAwesomeIcons.bars,
                size: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF006769), Color(0xFF40A578)],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const AboutScreen()),
                        );
                      },
                      child: const Icon(
                        FontAwesomeIcons.circleInfo,
                        size: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF006769), Color(0xFF40A578)],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        FontAwesomeIcons.volumeHigh,
                        size: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 350,
                    child: Center(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          SizedBox(
                            height: 200,
                            child: Opacity(
                                opacity: 0.2,
                                child: Image.asset('images/logo 1.png')),
                          ),
                          Container(
                            width: 300.0,
                            height: 300.0,
                            decoration: const BoxDecoration(
                              color: Colors.white60,
                              shape: BoxShape.circle,
                            ),
                          ),
                          CircularPercentIndicator(
                            radius: 150.0,
                            lineWidth: 10.0,
                            percent: soilMoisture / 100,
                            animation: true,
                            animationDuration: 500,
                            animateFromLastPercent: true,
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor: Colors.grey[200]!,
                            linearGradient: LinearGradient(
                              colors: soilMoisture <= 20
                                  ? [
                                      const Color(0xFF8B4513),
                                      const Color(0xFFD2B48C),
                                    ]
                                  : soilMoisture <= 40
                                      ? [
                                          const Color(0xFF40A578),
                                          const Color(0xFFC8FF7B),
                                        ]
                                      : [
                                          const Color(0xFF4080A5),
                                          const Color(0xFF8FCBFF),
                                        ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Kelembaban\n',
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0,
                                          color: soilMoisture <= 20
                                              ? const Color(0xFF8B4513)
                                              : soilMoisture <= 40
                                                  ? const Color(0xFF40A578)
                                                  : const Color(0xFF4080A5),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Tanah',
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0,
                                          color: soilMoisture <= 20
                                              ? const Color(0xFF8B4513)
                                              : soilMoisture <= 40
                                                  ? const Color(0xFF40A578)
                                                  : const Color(0xFF4080A5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${soilMoisture.toString()}%',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 96.0,
                                    color: soilMoisture <= 20
                                        ? const Color(0xFF8B4513)
                                        : soilMoisture <= 40
                                            ? const Color(0xFF40A578)
                                            : const Color(0xFF4080A5),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Status Tanah",
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      soilMoisture <= 20
                                          ? "Kering"
                                          : soilMoisture <= 40
                                              ? "Cukup"
                                              : "Basah",
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.0,
                                        color: soilMoisture <= 20
                                            ? const Color(0xFF8B4513)
                                            : soilMoisture <= 40
                                                ? const Color(0xFF40A578)
                                                : const Color(0xFF4080A5),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 175,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      children: <Widget>[
                        MyCard(
                          value: temperature.toString(),
                          icon: FontAwesomeIcons.temperatureHalf,
                          title: 'Suhu',
                          headerColor: const Color(0xFF006769),
                          valueColor: Colors.black,
                          unit: "Celsius",
                        ),
                        MyCard(
                          value: humidity.toString(),
                          icon: FontAwesomeIcons.droplet,
                          title: 'Kelembaban',
                          headerColor: const Color(0xFF006769),
                          valueColor: Colors.black,
                          unit: "Percent",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: const Color(0xFF006769),
                            minimumSize: const Size.fromHeight(60),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                          ),
                          child: Text(
                            "Tekan untuk Menyiram",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
            controller: _draggableController,
            initialChildSize: 0.23,
            minChildSize: 0.23,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          Center(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                                _draggableController.animateTo(
                                  isExpanded ? 0.8 : 0.23,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              icon: AnimatedRotation(
                                turns: isExpanded ? 0.5 : 0.0,
                                duration: const Duration(milliseconds: 300),
                                child: const Icon(
                                  FontAwesomeIcons.angleUp,
                                  size: 20.0,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          const MyStatsCard(
                            metricTitle: "Kelembaban Tanah",
                            sensorName: "Soil Moisture Sensor",
                            colorTitle: Color(0xFF693500),
                            statsIllustration: 'images/chart 1.png',
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const MyStatsCard(
                            metricTitle: "Suhu",
                            sensorName: "DHT22 Suhu",
                            colorTitle: Color(0xFF2C3193),
                            statsIllustration: 'images/chart 2.png',
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const MyStatsCard(
                            metricTitle: "Kelembaban Udara",
                            sensorName: "DHT22 Kelembaban",
                            colorTitle: Color(0xFF006769),
                            statsIllustration: 'images/chart 3.png',
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                              onPressed: () => _draggableController.animateTo(
                                    0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  backgroundColor: Colors.indigo,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0)),
                              child: const Text(
                                "Tutup",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ))
                        ]),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
