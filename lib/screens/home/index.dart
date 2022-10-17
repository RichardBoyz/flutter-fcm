import 'package:flutter/material.dart';
import 'package:flutteriosfcm/controller/controller.dart';
import 'package:flutteriosfcm/screens/list_detail/index.dart';
import 'package:get/get.dart';

class PageInfo {
  PageInfo({required this.title, required this.subtitle, required this.onTap});
  final Text title;
  final Text subtitle;
  final VoidCallback onTap;
}

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final _controller = Get.find<Controller>();
  final List<PageInfo> _tiles = [
    PageInfo(
      title: const Text("home to list"),
      subtitle: const Text('Get.toNamed(\'/home/list\')'),
      onTap: () => Get.toNamed('/home/list'),
    ),
    PageInfo(
      title: const Text("list to detail"),
      subtitle: const Text('Get.toNamed(\'/home/list/detail\')'),
      onTap: () => Get.toNamed('/home/list/detail'),
    ),
    PageInfo(
      title: const Text("Direct to detail"),
      subtitle: const Text('Get.toNamed(\'/home/list\')'),
      onTap: () => Get.to(const DetailView()),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home page'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: _tiles[index].title,
            subtitle: _tiles[index].subtitle,
            onTap: _tiles[index].onTap,
          );
        },
        itemCount: _tiles.length,
      ),
    );
  }
}

// ListView.builder(
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: _tiles[index].title,
//             subtitle: _tiles[index].subtitle,
//             onTap: _tiles[index].onTap,
//           );
//         },
//         itemCount: _tiles.length,
//       ),
