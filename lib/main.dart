import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/// The root widget that displays the material design application structure.
///
/// Provides the main application shell with a centered text greeting as the entry
/// point of the app.
class MainApp extends StatelessWidget {
  /// Creates a [MainApp].
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
