import 'package:flutter/material.dart';
import 'package:iot_app/components/build_team_member.dart';

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
            buildTeamMember(
              title: 'M. Bayu Fadayan',
              desc: '065121100',
              image: 'images/profiles/bay.jpg',
              showDesc: true,
            ),
            buildTeamMember(
              title: 'Fathur P. Shodikin',
              desc: '065121103',
              image: 'images/profiles/tur.jpeg',
              showDesc: true,
            ),
            buildTeamMember(
              title: 'Rafly R. Amtiar',
              desc: '065121107',
              image: 'images/profiles/pli.jpg',
              showDesc: true,
            ),
            buildTeamMember(
              title: 'Apriyan Fillah G',
              desc: '065121109',
              image: 'images/person.png',
              showDesc: true,
            ),
            buildTeamMember(
              title: 'Zidan Al Rasyid',
              desc: '065121112',
              image: 'images/person.png',
              showDesc: true,
            ),
          ],
        ),
      ),
    );
  }
}
