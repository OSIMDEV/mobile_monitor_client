import 'package:flutter/material.dart';
import 'package:mobile_monitor_client/pages/others/routemaster.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Routemaster.of(context).push('hero'),
              child: const Text('Test hero animations work'),
            ),
            const SizedBox(height: 20),
            Hero(
              tag: 'my-hero',
              child: Container(
                color: Colors.red,
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroPage extends StatelessWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 300),
          Center(
            child: Hero(
              tag: 'my-hero',
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
