import 'package:flutter/material.dart';

class FamilyCollaborationScreen extends StatelessWidget {
  const FamilyCollaborationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('家庭协作'),
      ),
      body: const Center(
        child: Text(
          '功能开发中...',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
