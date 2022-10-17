import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail page'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('back'),
            subtitle: const Text('Get.back()'),
            onTap: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
