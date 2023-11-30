import 'package:flutter/material.dart';
import 'package:frontend/src/controllers/home_controller.dart';
import 'package:frontend/src/pages/calendar.dart';
import 'package:frontend/src/pages/messages.dart';
import 'package:frontend/utils.dart';
import 'package:get/get.dart';

import 'login.dart';
import 'medicines.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        appBar: appBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/messages');
          },
          child: const Icon(Icons.message),
        ),
        body: homeBody(),
      ),
    );
  }

  Drawer drawer() {
    return Drawer(
      // column holds all the widgets in the drawer
      child: Column(
        children: <Widget>[
          Expanded(
            // ListView contains a group of widgets that scroll inside the drawer
            child: ListView(
              children: const <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Text(
                    'Together',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // This container holds the align
          Align(
              alignment: FractionalOffset.bottomCenter,
              // This container holds all the children that will be aligned
              // on the bottom and should not scroll with the above ListView
              child: Column(
                children: <Widget>[
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Delete medicines',
                        style: TextStyle(fontSize: 20)),
                    onTap: () {
                      deleteMedicinesFromSharedPreferences();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Delete Preferences',
                        style: TextStyle(fontSize: 20)),
                    onTap: () {
                      deleteUserDataFromSharedPreferences();
                      deleteCalendarEventsFromSharedPreferences();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title:
                        const Text('Calendar', style: TextStyle(fontSize: 20)),
                    onTap: () {
                      Get.to(() => const Calendar());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.medication_outlined),
                    title:
                        const Text('Medicines', style: TextStyle(fontSize: 20)),
                    onTap: () {
                      Get.to(() => Medicines());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.message),
                    title:
                        const Text('Messages', style: TextStyle(fontSize: 20)),
                    onTap: () {
                      Get.to(() => const Messages());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout', style: TextStyle(fontSize: 20)),
                    onTap: () async {
                      await deleteUserDataFromSharedPreferences();
                      Get.off(() => const Login());
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      elevation: 1,
      centerTitle: true,
      title: const Text('Together',
          style: TextStyle(color: Colors.black, fontSize: 46)),
    );
  }

  Widget homeBody() {
    return Column(
      children: [
        welcomeMessage(),
        moodFaces(),
        nextDose(),
      ],
    );
  }

  Center nextDose() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 2, right: 2),
        width: double.infinity,
        child: Card(
          color: Colors.green,
          elevation: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.medication_outlined),
                title: Text(
                  'Your next dose',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle:
                    Text('Loratadine 10mg 2pm', style: TextStyle(fontSize: 16)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('MARK AS COMPLETED',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row moodFaces() {
    return const Row(
      children: [
        Expanded(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(
                child: Icon(Icons.mood, size: 50),
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(
                //TODO: find a more appropiate serious face icon
                child: Icon(Icons.face, size: 50),
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(
                child: Icon(Icons.mood_bad, size: 50),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Center welcomeMessage() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 2, right: 2),
        width: double.infinity,
        child: const Card(
          elevation: 2,
          color: Colors.green,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.green,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: SizedBox(
            width: 300,
            height: 100,
            child: Center(
              child: Text('How are you feeling today?',
                  style: TextStyle(fontSize: 24)),
            ),
          ),
        ),
      ),
    );
  }
}
