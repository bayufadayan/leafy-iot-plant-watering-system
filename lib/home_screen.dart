import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF0FFDD),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 32.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: 24.0, color: Color(0xFF00643C)),
                  Icon(Icons.volume_up, size: 24.0, color: Color(0xFF00643C)),
                ],
              ),SizedBox(
                height: 10.0,
              ),
              
            ],
          ),
        )
      ),
    );
  }
}
