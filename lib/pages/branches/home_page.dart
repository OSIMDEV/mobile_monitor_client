import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_monitor_client/pages/branches/branches_nav_helper.dart';
import 'package:mobile_monitor_client/pages/branches/detail_page.dart';
import 'package:mobile_monitor_client/pages/normal/page_j.dart';

const String pageBranchesHome = 'pageBranchesHome';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageBranchesHome),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(pageBranchesDetail);
              },
              child: const Text('Push Detail'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Using push method of router enable us to navigate in the current tab without losing the shell',
                textAlign: TextAlign.center,
              ),
            ),

            /// TODO continue
            ElevatedButton(
              onPressed: () {
                context.pushNamed(pageBranchesRootDetail);
              },
              child: const Text('Push Detail From Root Navigator'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Using push method of router enable us to navigate in the current tab without losing the shell',
                textAlign: TextAlign.center,
              ),
            ),

            ElevatedButton(
              onPressed: () {
                context.goNamed(pageJ);
              },
              child: const Text('Go to PageJ'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Go outside???',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
