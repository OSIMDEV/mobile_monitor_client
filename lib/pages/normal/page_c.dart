import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_monitor_client/pages/home_page.dart';

const String pageC = 'pageC';

class PageC extends StatelessWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('PageC'),
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
