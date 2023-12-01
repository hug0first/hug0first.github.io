import 'package:flutter/material.dart';
import '../Pages/homePage.dart';

void main() {
  runApp(const PhotoSite());
}

class PhotoSite extends StatelessWidget {
  const PhotoSite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Photo Room',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFF28F3B),
          onPrimary: Color(0xFFF28F3B),
          secondary: Color(0xFF588B8B),
          onSecondary: Color(0xFF588B8B),
          error: Colors.red,
          onError: Colors.redAccent,
          background: Color(0xFFFFE6D4),
          onBackground: Color(0xFFFFD5C2),
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        useMaterial3: true,
        fontFamily: 'Josefin Sans',
      ),
      home: const HomePage(),
    );
  }
}


