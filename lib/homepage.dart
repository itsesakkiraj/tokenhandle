// home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String authToken;

  HomePage({required this.authToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Page!'),
            SizedBox(height: 20),
            Text('Auth Token: $authToken'),
          ],
        ),
      ),
    );
  }
}
