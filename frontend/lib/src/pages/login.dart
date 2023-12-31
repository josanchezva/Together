import 'package:flutter/material.dart';
import 'package:frontend/src/controllers/login_controller.dart';
import 'package:frontend/src/pages/sign_up.dart';
import 'package:frontend/utils.dart';
import 'package:get/get.dart';
import '../services/user_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: logInBody(),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      elevation: 1,
      centerTitle: true,
      title: const Text('Login', style: TextStyle(color: Colors.black,fontSize: 46)),
      actions: const [
        TextButton(
          onPressed: getOffHome,
          child: Text('Sign Up'),
        ),
      ],
    );
  }

  Widget logInBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailFieldController,
                    //validator: (value) => validateEmail(value!),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: !_isVisible,
                    controller: _passwordFieldController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(_isVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () => setState(() {
                          _isVisible = !_isVisible;
                        }),
                      ),
                    ),
                    //validator: (value) => validatePassword(value!),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: logInuserButton()),
                ]),
              )),
          TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
        ]),
      ),
    );
  }

  ElevatedButton logInuserButton() {
    return ElevatedButton(
        onPressed: () async {},
        child: const Text('Login'));
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

}
