import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iot_app/about_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.zero,
            bottomRight: Radius.circular(15.0)),
      ),
      semanticLabel: "Menu",
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            color: Colors.green,
            child: const SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/logo 1.png'),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Pilih menu di bawah',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.circleInfo,
                    color: Colors.green,
                  ),
                  title: const Text(
                    'Tentang Kami',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const AboutScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.chartArea,
                    color: Colors.green,
                  ),
                  title: const Text(
                    'Statistik',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.download,
                    color: Colors.green,
                  ),
                  title: const Text(
                    'Download Data',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.toolbox,
                    color: Colors.green,
                  ),
                  title: const Text(
                    'Tentang Alat',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),

          // Footer
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            color: Colors.green.shade100,
            child: const Text(
              '© 2024 Leafy IOT',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
