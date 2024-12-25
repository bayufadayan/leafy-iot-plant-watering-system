import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatefulWidget {
  final String value;
  final IconData icon;
  final String title;
  final Color headerColor;
  final Color valueColor;

  // Constructor
  const MyCard({
    super.key,
    required this.value,
    required this.icon,
    required this.title,
    required this.headerColor,
    required this.valueColor,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth / 2 - 16,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: const Color.fromRGBO(0, 103, 105, 0.7),
            width: 1.0,
          ),
        ),
        child: Card(
          elevation: 0,
          shadowColor: Colors.white,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 0.1,
                child: Icon(
                  widget.icon,
                  color: widget.headerColor,
                  size: 90,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      color: const Color(0xFF006769),
                    ),
                  ),
                  Text(
                    widget.value,
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w800,
                      fontSize: 50.0,
                      color: const Color(0xFF006769),
                    ),
                  ),
                  Text(
                    "Celcius",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      color: const Color(0xFF006769),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
