import 'package:flutter/material.dart';

class MedicineInventoryScreen extends StatelessWidget {
  const MedicineInventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('药品库存'),
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
