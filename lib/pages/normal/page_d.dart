import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_monitor_client/pages/home_page.dart';
import 'package:mobile_monitor_client/services/download_service.dart';

const String pageD = 'pageD';

class PageD extends StatefulWidget {
  const PageD({super.key});

  @override
  PageDState createState() => PageDState();
}

class PageDState extends State<PageD> {
  @override
  void initState() {
    downloadService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('PageD'),
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
              )
            ],
          ),
        ),
      );
}
