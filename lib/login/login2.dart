import 'package:flutter/material.dart';
import 'package:flutter38/login/login1.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  String name = "";
  String email = "";
  String password = "";
  String passwordConfirm = "";

  void register() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Map<String, dynamic> user = {
        "name": name,
        "email": email,
        "password": password,
        "passwordConfirm": passwordConfirm,
      };

      // Show the success dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Column(
              children: [
                Image.asset(
                  "assets/images/image.png",
                  width: 200,
                  height: 200,
                ),
                 Text(
                  "Your account has been created successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(
                  height: 20,
                ),
                Text(
                  "Congratulations! You have successfully created your account.",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop(user);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos ism kiriting";
    } else if (value.length < 4) {
      return "Iltimos uzunroq ism kiriting";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos elektron pochta kiriting";
    } else if (!value.contains("@") ||
        !value.substring(value.indexOf("@")).contains(".")) {
      return "To'g'ri elektron pochta kiriting";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos parol kiriting";
    } else if (value.length < 8) {
      return "Iltimos eng kamida 8ta element kiriting";
    }
    return null;
  }

  String? validatePasswordConfirm(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos parolni tasdiqlang";
    } else if (value != passwordController.text) {
      return "Parollar mos kelmadi";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ro'yxatdan o'tish"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "RO'YXATDAN O'TISH",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Ism",
                    labelText: "Ism",
                  ),
                  validator: validateName,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      name = newValue;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Elektron pochta",
                    labelText: "Elektron pochta",
                  ),
                  validator: validateEmail,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      email = newValue;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Parol",
                    labelText: "Parol",
                  ),
                  validator: validatePassword,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      password = newValue;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Parol tasdiqlang",
                    labelText: "Parol tasdiqlang",
                  ),
                  validator: validatePasswordConfirm,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      passwordConfirm = newValue;
                    }
                  },
                  onFieldSubmitted: (value) {
                    register();
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: const Text("RO'YXATDAN O'TISH"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
