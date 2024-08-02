import 'package:flutter/material.dart';
import 'package:flutter_page_lifecycle/flutter_page_lifecycle.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_monitor_client/pages/branches/sign_up_page.dart';
import 'package:mobile_monitor_client/pages/normal/normal_page.dart';
import 'package:mobile_monitor_client/pages/scan/scan_page.dart';
import 'package:mobile_monitor_client/stack_monitor.dart';
import 'package:mobile_monitor_client/web_api.dart';

const String homePage = '/';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements IActionable {
  StackMonitor? stackMonitor;

  @override
  void initState() {
    super.initState();
    stackMonitor = StackMonitor.duration(1);
    stackMonitor!.register(this);
    stackMonitor!.start();
    stackMonitor!.resume();
  }

  @override
  void action() {
    if (context.mounted) {
      final paths = <String>[];
      GoRouter.of(context)
          .routerDelegate
          .currentConfiguration
          .matches
          .reversed
          .forEach((e) {
        final runtimeType = e.runtimeType;
        if (ImperativeRouteMatch == runtimeType || RouteMatch == runtimeType) {
          paths.add((e as RouteMatch).route.path);
        } else if (ShellRouteMatch == runtimeType) {
          final subPaths = (e as ShellRouteMatch)
              .matches
              .map((e) => (e.route as GoRoute).path);
          paths.addAll([...subPaths].reversed);
        }
      });
      webService.postl1(
        type: load,
        names: paths,
      );
    }
  }

  @override
  void dispose() {
    stackMonitor?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageLifecycle(
        stateChanged: (appear) {
          // if (appear) {
          //   stackMonitor?.resume();
          // } else {
          //   stackMonitor?.pause();
          // }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Home Page'),
            actions: [
              GestureDetector(
                child: const Icon(
                  Icons.qr_code_scanner,
                ),
                onTap: () async {
                  final code = await context.pushNamed(scanPage) as String?;
                  if (null != code) await webService.setIP(code);
                },
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    context.goNamed(normalPage);
                  },
                  child: Text(
                    'Normal',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    context.goNamed(pageBranchesSignUp);
                  },
                  child: Text(
                    'Branches (SignUp)',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
