import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_monitor_client/pages/branches/detail_page.dart';
import 'package:mobile_monitor_client/pages/branches/home_page.dart';
import 'package:mobile_monitor_client/pages/branches/setting_pages.dart';

import '../normal/page_l.dart';

const String pageBranchesSearch = 'pageBranchesSearch';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageBranchesSearch),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(pageBranchesHome);
                context.pushNamed(pageBranchesDetail);
              },
              child: const Text('Go Home Tab -> Push Detail Page'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'It will change the tab without loosing the state',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(pageBranchesSettings);
              },
              child: const Text('Go Settings Tab'),
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
                context.go('/$pageBranchesSearch/$pageL');
              },
              child: const Text('Go To L'),
            ),
          ],
        ),
      ),
    );
  }
}
