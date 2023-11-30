
import 'package:frontend/src/models/medicine.dart';
import 'package:get/get.dart';

import '../services/user_medicines_service.dart';

class MedicinesController extends GetxController {
  UserMedicinesService userMedicinesService = UserMedicinesService();
  RxList<Medicine> userMedicines = <Medicine>[].obs;
  RxBool isControllerReady = false.obs;
  @override
  void onInit() {
    loadUserMedicines();
    super.onInit();
  }

  loadUserMedicines() async {
    var loadedUserMedicines = await userMedicinesService.loadUserMedicines();
    if (loadedUserMedicines == null || loadedUserMedicines.isEmpty) {
      userMedicines.value = [];
    } else {
      userMedicines.value = loadedUserMedicines;
    }
    isControllerReady.value = true;
  }

  saveUserMedicines() async {
    await userMedicinesService.saveUserMedicines(userMedicines);
  }
}
