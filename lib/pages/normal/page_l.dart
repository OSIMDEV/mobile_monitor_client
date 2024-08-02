import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_monitor_client/pages/branches/setting_pages.dart';
import 'package:mobile_monitor_client/pages/home_page.dart';
import 'package:mobile_monitor_client/pages/normal/page_m.dart';
import 'package:mobile_monitor_client/pages/normal/page_n.dart';
import 'package:mobile_monitor_client/services/download_service.dart';
import 'package:mobile_monitor_client/tests/test_pages.dart';

const String pageL = 'pageL';

class PageL extends StatefulWidget {
  const PageL({super.key});

  @override
  State<PageL> createState() => _PageLState();
}

class _PageLState extends State<PageL> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      if (context.mounted) {
        context.go('/$pageBranchesSettings/$pageM/$pageN');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('PageL'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  context.go(homePage);
                },
                child: Text(
                  'Go Home',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  context.go(toPageJ);
                },
                child: Text(
                  'Go To PageJ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  context.push(toPageJ);
                },
                child: Text(
                  'Push PageJ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  final ready = await downloadService.ready;
                  if (ready && context.mounted) {
                    context.goNamed(homePage);
                  }
                },
                child: Text(
                  'State Transfer',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
      );
}
