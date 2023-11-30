import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/src/pages/messages.dart';
import 'package:frontend/together_theme.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:logger/logger.dart';
import 'src/pages/calendar.dart';
import 'src/pages/home.dart';
import 'src/pages/login.dart';
import 'src/pages/sign_up.dart';

Future main() async {
  await dotenv.load(fileName:'.env');
  WidgetsFlutterBinding.ensureInitialized();
  Logger.level = Level.info;
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
      //darkTheme: TogetherTheme.dark(),
      darkTheme: TogetherTheme.light(),
      initialRoute: '/login',
      routes: {
        '/home': (context) => const Home(),
        '/login': (context) => const Login(),
        '/sign_up': (context) => const SignUp(),
        '/messages': (context) => const Messages(),
        '/calendar': (context) => const Calendar(),
      },
    );
  }
}
