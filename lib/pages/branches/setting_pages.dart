import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_monitor_client/pages/branches/sign_in_page.dart';
import 'package:mobile_monitor_client/pages/branches/sign_up_page.dart';
import 'package:mobile_monitor_client/pages/normal/page_m.dart';

const String pageBranchesSettings = 'pageBranchesSettings';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageBranchesSettings),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(pageBranchesSignIn);
              },
              child: const Text('Go SignIn Page'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Or instead we can launch the bottom navigation page(with shell) for different tab with only changing the path',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(pageBranchesSignUp);
              },
              child: const Text('Push SignIn Page'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Or instead we can launch the bottom navigation page(with shell) for different tab with only changing the path',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(pageM);
              },
              child: const Text('Go To M'),
            ),
          ],
        ),
      ),
    );
  }
}
