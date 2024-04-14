// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';
import 'loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TokenHandler(),
      child: MaterialApp(
        title: 'Token Storage Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<TokenHandler>(
          builder: (context, tokenHandler, _) {
            print(tokenHandler.authToken);
            return tokenHandler.authToken != null
                ? HomePage(authToken: tokenHandler.authToken!)
                : LoginScreen();
          },
        ),
      ),
    );
  }
}

class TokenHandler extends ChangeNotifier {
  String? _authToken;
  SharedPreferences? _prefs;

  String? get authToken => _authToken;

  void _init() async {
    _prefs = await SharedPreferences.getInstance();
    _authToken = _prefs?.getString('auth_token');
    notifyListeners();
  }

  TokenHandler() {
    _init();
  }

  void storeToken(String token) {
    _authToken = token;
    _prefs!.setString('auth_token', token);
    notifyListeners();
  }

  void setToken() {
    String? token = 'a123567890';
    storeToken(token);
    print("saaaaa");
    notifyListeners();
  }

  // void generateAndStoreToken() {
  //   // Simulating successful login
  //   String authToken = _generateToken();
  //   storeToken(authToken);
  // }
  //
  // String _generateToken() {
  //   // Generating a random token
  //   final random = Random();
  //   return String.fromCharCodes(
  //       List.generate(26, (index) => random.nextInt(26) + 97));
  // }
}
