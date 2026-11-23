
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Firebase',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan Firebase'),
        ),
        body: const Center(
          child: Text(
            'Firebase Berhasil Terhubung!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
