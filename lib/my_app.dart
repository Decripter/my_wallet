import 'package:flutter/material.dart';
import 'package:my_wallet/add_card/pages/add_card.dart';

/// Widget responsable to mount MaterialApp
class MyApp extends StatefulWidget {
  /// Constructor method no has special parameters
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddCardPage(),
    );
  }
}
