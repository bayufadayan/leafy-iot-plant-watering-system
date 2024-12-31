import 'package:flutter/material.dart';
import 'package:iot_app/components/build_team_member.dart';

class ToolDeatilScreen extends StatelessWidget {
  const ToolDeatilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alat dan Bahan',
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
              title: 'Breadboard',
              desc: 'xxxx',
              image: 'images/person.jpg',
              showDesc: false,
            ),
            buildTeamMember(
              title: 'Jumper',
              desc: 'xxxx',
              image: 'images/person.jpg',
              showDesc: false,
            ),
          ],
        ),
      ),
    );
  }
}
