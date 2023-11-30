import 'package:flutter/material.dart';
import 'package:frontend/src/pages/home.dart';
import 'package:frontend/utils.dart';
import 'package:get/get.dart';
import '../controllers/sign_up_controller.dart';
import '../models/user.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpController signUpController = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _nameFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _confirmPasswordFieldController = TextEditingController();
  bool _isVisible = false;
  // ignore: unused_field
  bool _isLoading = false;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 1,
        centerTitle: true,
        title: const Text('Sign Up', style: TextStyle(color: Colors.black, fontSize: 46)),
        actions: [
          TextButton(
            onPressed: () {
              Get.off(() => const Login());
            },
            child: const Text('Login'),
          ),
        ],
      ),
      body: signUpBody(),
    );
  }

  Widget signUpBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _nameFieldController,
                    //validator: (value) => validateName(value!),
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
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
                      border: const OutlineInputBorder(),
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
                  TextFormField(
                    obscureText: !_isVisible,
                    keyboardType: TextInputType.emailAddress,
                    controller: _confirmPasswordFieldController,
                    //validator: (value) => validateMatchingPasswords(value!),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(_isVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () => setState(() {
                          _isVisible = !_isVisible;
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    title: const Text(
                        'I would like to receive your newsletter and other promotional information.'),
                    leading: Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: createUserRequestButton()),
                ]),
              )),
          TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
        ]),
      ),
    );
  }

  ElevatedButton createUserRequestButton() {
    return ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            setState(() {
              _isLoading = true;
            });
            var newUser = await signUpController.createUser(
              _emailFieldController.text,
              _nameFieldController.text,
              _passwordFieldController.text,
            );
            setState(() {
              _isLoading = false;
            });
            if (newUser.runtimeType == User) {
              saveUserDataInSharedPreferences(newUser);
              Get.snackbar(
                'Se ha creado el usuario correctamente',
                'Bienvenido',
                duration: const Duration(seconds: 3),
              );
              Get.off(() => const Home());
            } else {
              Get.snackbar(
                'Error',
                newUser,
                duration: const Duration(seconds: 3),
              );
            }
          }
        },
        child: const Text('Sign Up'));
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

  String? validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  String? validateName(String s) {
    return s.isEmpty ? 'Please enter username' : null;
  }

  String? validateMatchingPasswords(String value) {
    if (_passwordFieldController.text != _confirmPasswordFieldController.text) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }
}
