import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_monitor_client/pages/example/mobile_app/app_state/app_state.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoSwitch(
                  value: appState.showBonusTab,
                  onChanged: (value) {
                    appState.showBonusTab = value;
                  },
                ),
                const SizedBox(width: 10),
                const Text('Show bonus tab'),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Provider.of<AppState>(context, listen: false)
                  .isLoggedIn = false,
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
