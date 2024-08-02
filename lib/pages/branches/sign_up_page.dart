import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_monitor_client/pages/branches/sign_in_page.dart';

const String pageBranchesSignUp = 'pageBranchesSignUp';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageBranchesSignUp),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.pushNamed(pageBranchesSignIn);
              },
              child: const Text('Push SignIn'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Using push method of router enable us to go back functionality',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
