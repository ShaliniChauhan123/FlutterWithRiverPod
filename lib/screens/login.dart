import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  void login() async {
    try {
      setState(() {
        _isLoading = true;
      });
      print('login');
      await ref.read(asyncAuthProvider.notifier).login(
            phoneNumber: phoneNoController.text,
            password: passwordController.text,
            context: context,
          );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User does not exists.'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Image(image: AssetImage('assets/Fifo.jpg'))),
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: const Text('Become a Successful Technology Innovator',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
          const SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  //  padding: EdgeInsets.all(16.0),
                  child: const Image(image: AssetImage('assets/right.jpg'))),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: const Text('Learn from technology experts'),
              )
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 16.0),
                child: const Image(image: AssetImage('assets/right.jpg')),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: const Text('Learn from technology experts'),
              )
            ],
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Form(
                child: Column(children: <Widget>[
              TextFormField(
                controller: phoneNoController,
                validator: (String? msg) {
                  if (msg != null && msg.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              TextFormField(
                controller: passwordController,
                validator: (String? msg) {
                  if (msg != null && msg.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              )
            ])),
          ),
          const SizedBox(height: 16.0),
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: const Text('Forgot Password?',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue)),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        )),
                    onPressed: () {
                      // ignore: avoid_print
                      login();
                      print(passwordController.text);
                      print(phoneNoController.text);
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
