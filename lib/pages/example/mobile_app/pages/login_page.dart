import 'package:flutter/material.dart';
import 'package:mobile_monitor_client/pages/example/mobile_app/app_state/app_state.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Provider.of<AppState>(context, listen: false).isLoggedIn = true;
              },
              child: const Text('Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
