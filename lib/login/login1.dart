import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter38/login/login3.dart';

import 'login2.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, dynamic>? user;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? emailError;
  String? passwordError;
  String userError = "";

  void login() {
    // ma'lumotlarni olamiz va tekshiramiz
    validateEmail();
    validatePassword();

    if (emailError == null && passwordError == null) {
      if (user == null) {
        userError = "Foydalanuvchi topilmadi, iltimos ro'yxatdan o'ting";
        setState(() {});
      } else {
        if (user!['email'] == emailController.text &&
            user!['password'] == passwordController.text) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) {
                return const login3();
              },
            ),
          );
        } else {
          userError = "Email yoki parol xato";
          setState(() {});
        }
      }
    }
  }

  void validateEmail() {
    String email = emailController.text;

    setState(() {
      if (email.isEmpty) {
        emailError = "Iltimos elektron pochta kiriting";
      } else if (!email.contains("@") ||
          !email.substring(email.indexOf("@")).contains(".")) {
        emailError = "To'g'ri elektron pochta kiriting";
      } else {
        emailError = null;
      }
    });
  }

  void validatePassword() {
    String password = passwordController.text;

    setState(() {
      if (password.isEmpty) {
        passwordError = "Iltimos parol kiriting";
      } else {
        passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            const Row(
            children: [
            Text(
            "Welcome back",
              style: TextStyle(
                fontSize: 34,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            ],
                    ),
                    const Row(
            children: [
              Text(
                "Let's Login to Connect to your email",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
                    ),
                    const SizedBox(
            height: 20,
                    ),
                    if (userError.isNotEmpty)
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
            userError,
            style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.email),
                hintText: "Elektron pochta",
                labelText: "Elektron pochta",
                errorText: emailError,
                ),
                onChanged: (value) {
                validateEmail();
                },
                ),
                const SizedBox(height: 10),
                TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.key_sharp),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.eye_slash),
                  ),
                  hintText: "Parol",
                  labelText: "Parol",
                  errorText: passwordError,
                ),
                  onChanged: (value) {
                    validatePassword();
                  },
                  onSubmitted: (value) {
                    login();
                  },
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Forget your password?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an an account?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        user = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) {
                              return const RegisterPage();
                            },
                          ),
                        );
                        print(user);
                        if (user != null) {
                          setState(() {});
                        }
                      },
                      child: const Text(
                        "Sign up here",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: login,
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
                    child: const Text("Log in"),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
            
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.apple),
                                  SizedBox(width: 5,),
                                  Text("Apple",style: TextStyle(
                                    color: Colors.black,
                                  ),)
                                ],
                              ),
                            ),
                          )
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
            
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.apple,color: Colors.red,),
                                  SizedBox(width: 5,),
                                  Text("Google",style: TextStyle(
                                    color: Colors.black,
                                  ),)
                                ],
                              ),
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}