import 'package:flutter/material.dart';
import 'package:frontend/src/models/medicine.dart';
import 'package:get/get.dart';

import '../controllers/medicines_controller.dart';

class Medicines extends StatelessWidget {
  final MedicinesController medicinesController =
      Get.put(MedicinesController());
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  Medicines({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              createMedicineDialog(context);
            },
            child: const Icon(Icons.add),
          ),
          appBar: appBar(),
          body: Obx(() {
            if (!medicinesController.isControllerReady.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: medicinesController.userMedicines.length,
                  itemBuilder: (context, index) {
                    return medicineCard(
                        medicinesController.userMedicines[index]);
                  });
            }
          })),
    );
  }

  Future<dynamic> createMedicineDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Center(child: Text('New Medicine')),
              contentPadding: const EdgeInsets.all(20),
              content: Form(
                key: _formKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                      ),
                      TextFormField(
                        controller: _nameController,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      const Text('Notes'),
                      TextFormField(
                        controller: _notesController,
                        minLines: 5,
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Medicine medicine = Medicine(
                          id: 'null',
                          name: _nameController.text,
                          comercialName: 'null',
                          composition: 'null',
                          requireFormula: false,
                          dosage: 'null',
                          pharmaceuticalLabs: 'null',
                          usage: _notesController.text);
                      medicinesController.userMedicines.add(medicine);
                      medicinesController.saveUserMedicines();

                      Get.back();
                    },
                    child: const Text('Add'))
              ],
            ));
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      elevation: 1,
      centerTitle: true,
      title: const Text('Medicines',
          style: TextStyle(color: Colors.black, fontSize: 46)),
    );
  }

  Widget medicineCard(Medicine medicine) {
    return ListTile(
      leading: const Icon(Icons.medication_outlined),
      title: Text(medicine.name, style: const TextStyle(fontSize: 20)),
      subtitle: Text(medicine.usage, style: const TextStyle(fontSize: 16)),
      onTap: () {},
    );
  }
}
