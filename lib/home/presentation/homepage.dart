import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome $userId'),
      ),
    );
  }
}
