import 'package:contact_tracing_3a/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

//!!!CONTACT TRACING APP
//TODO:
//!1. Register account: a) client b) establishment
//2. Login account: a) client b) establishment
//3. Create QR Code
//4. Scan QR Code
//5. Trace

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ContactTrace());
}

class ContactTrace extends StatelessWidget {
  const ContactTrace({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black54,
          ),
          displayMedium: TextStyle(
            fontSize: 16,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[200],
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
