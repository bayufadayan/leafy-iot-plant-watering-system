import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tim Pengembang',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF006769),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 10.0,
          ),
          children: [
            _buildTeamMember(
              name: 'M. Bayu Fadayan',
              role: '065121100',
              image: 'images/person.jpg',
            ),
            _buildTeamMember(
              name: 'Fathur P. Shodikin',
              role: '065121103',
              image: 'images/person.jpg',
            ),
            _buildTeamMember(
              name: 'Rafly R. Amtiar',
              role: '065121107',
              image: 'images/person.jpg',
            ),
            _buildTeamMember(
              name: 'Apriyan Fillah G',
              role: '065121109',
              image: 'images/person.jpg',
            ),
            _buildTeamMember(
              name: 'Zidan Al Rasyid',
              role: '065121112',
              image: 'images/person.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(
      {required String name, required String role, required String image}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 255, 255, 0),
                  Color.fromRGBO(255, 255, 255, 0),
                  Color.fromRGBO(255, 255, 255, 0.9),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.quicksand(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
