
import 'package:get/get.dart';

import 'src/pages/home.dart';

getOffHome(){
  Get.off(const Home());
}
getHome(){
  Get.to(const Home());
}
