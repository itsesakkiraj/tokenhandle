// login_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // Provider.of<TokenHandler>(context, listen: false).setToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final tokenprovider = Provider.of<TokenHandler>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<TokenHandler>(context, listen: false).setToken();
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
