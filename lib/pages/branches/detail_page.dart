import 'package:flutter/material.dart';

const String pageBranchesDetail = 'pageBranchesDetail';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageBranchesDetail),
      ),
    );
  }
}
