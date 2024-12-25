import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iot_app/components/card.dart';
import 'package:iot_app/components/drawer.dart';
import 'package:iot_app/components/stats_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> titleCard = ["Suhu", "Kelembaban"];
  final List<String> valueCard = ["23.4", "73"];
  final List<IconData> iconCard = [
    FontAwesomeIcons.temperatureHalf,
    FontAwesomeIcons.droplet
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final DraggableScrollableController _draggableController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MyDrawer(),
      backgroundColor: const Color.fromARGB(255, 239, 250, 225),
      body: Stack(
        children: [
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShaderMask(
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
                            color: Colors
                                .white, // The color here is ignored due to ShaderMask
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 380,
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
                          percent: 0.75,
                          animation: true,
                          animationDuration: 500,
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: Colors.grey[200]!,
                          linearGradient: const LinearGradient(
                            colors: [
                              Color(0xFF40A578),
                              Color(0xFFC8FF7B),
                            ], // Warna gradient
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
                                        color: const Color(0xFF40A578),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Tanah', // Teks "Tanah"
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.0,
                                        color: const Color(0xFF40A578),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "75",
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w700, // Medium
                                  fontSize: 96.0,
                                  color: const Color(0xFF40A578),
                                ),
                              ),
                              Text(
                                "Percent",
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0,
                                  color: const Color(0xFF40A578),
                                ),
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
                  child: Expanded(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      children: const <Widget>[
                        MyCard(
                          value: '23.43',
                          icon: FontAwesomeIcons.temperatureHalf,
                          title: 'Suhu',
                          headerColor: Color(0xFF006769),
                          valueColor: Colors.black,
                          unit: "Celsius",
                        ),
                        MyCard(
                          value: '72.31',
                          icon: FontAwesomeIcons.droplet,
                          title: 'Kelembaban',
                          headerColor: Color(0xFF006769),
                          valueColor: Colors.black,
                          unit: "Percent",
                        ),
                      ],
                    ),
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
          )),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: DraggableScrollableSheet(
              controller: _draggableController,
              initialChildSize: 0.2,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              builder:
                  (BuildContext context, ScrollController scrollController) {
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
                                  _draggableController.animateTo(
                                    1.0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.angleUp,
                                  size: 20.0,
                                  color: Colors.black54,
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
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  backgroundColor: Colors.indigo,
                                  padding: const EdgeInsets.symmetric(vertical: 14.0)
                                ),
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
          ),
        ],
      ),
    );
  }
}
