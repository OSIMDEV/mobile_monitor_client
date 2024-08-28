import 'package:flutter/material.dart';
import 'package:mobile_monitor_client/pages/example/mobile_app/app_state/app_state.dart';
import 'package:mobile_monitor_client/pages/others/routemaster.dart';
import 'package:provider/provider.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final tabPage = TabPage.of(context);

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabPage.controller,
          tabs: [
            const Tab(
              icon: Icon(Icons.directions_car),
              text: 'Home',
            ),
            if (appState.showBonusTab)
              const Tab(
                icon: Icon(Icons.directions_transit),
                text: 'Bonus',
              ),
            const Tab(
              icon: Icon(Icons.directions_car),
              text: 'Settings',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabPage.controller,
        children: [
          for (final stack in tabPage.stacks) PageStackNavigator(stack: stack),
        ],
      ),
    );
  }
}
