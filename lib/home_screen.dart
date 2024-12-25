import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iot_app/components/card.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 250, 225),
      body: SafeArea(
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
                  child: const Icon(
                    FontAwesomeIcons.bars,
                    size: 18.0,
                    color: Colors
                        .white, // The color here is ignored due to ShaderMask
                  ),
                ),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF006769), Color(0xFF40A578)],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Icon(
                      FontAwesomeIcons.volumeHigh,
                      size: 18.0,
                      color: Colors
                          .white, // The color here is ignored due to ShaderMask
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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return MyCard(
                      value: '${index + 1}',
                      icon: FontAwesomeIcons.droplet,
                      title: 'Kelembaban',
                      headerColor: const Color(0xFF006769),
                      valueColor: Colors.black,
                    );
                  },
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
            )
          ],
        ),
      )),
    );
  }
}
