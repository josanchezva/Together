import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/together_theme.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'src/pages/home.dart';
import 'src/pages/login.dart';
import 'src/pages/sign_up.dart';


Future main() async{
  await dotenv.load(fileName: '.env');
  runApp(const Together());
}

class Together extends StatelessWidget {
  const Together({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Together',
      debugShowCheckedModeBanner: false,
      theme: TogetherTheme.light(),
      darkTheme: TogetherTheme.dark(),
      initialRoute: '/login',
      routes: {
        '/home': (context) => const Home(),
        '/login': (context) => const Login(),
        '/sign_up': (context) => const SignUp(),
      },
    );
  }
}
