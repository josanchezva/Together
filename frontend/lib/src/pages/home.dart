import 'package:flutter/material.dart';
import 'package:frontend/src/controllers/home_controller.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/messages');
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
