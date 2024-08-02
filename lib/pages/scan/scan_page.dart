import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_monitor_client/components/qr_utils.dart';

const String scanPage = 'scanPage';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) => QRScanner(
        block: (code) {
          context.pop(code);
        },
      );
}
