import 'package:flutter/material.dart';
import 'package:mobile_monitor_client/pages/others/routemaster.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'article_page.dart';
import 'link_handler.dart';
import 'login_page.dart';
import 'notifications.dart';

// Launch a deep link in iOS simulator from command line:
// xcrun simctl openurl booted routemaster://article/1

deepLinkingMain() => const MyApp();

// This is a route to be shown shown when the app is logging in, or whilst
// checking whether a user's log in is still valid
final initializingRoutes = RouteMap(
  // This only defines an unknown route
  onUnknownRoute: (route) => MaterialPage<void>(
    child: Scaffold(
      appBar: AppBar(),
      body: const Center(child: CircularProgressIndicator()),
    ),
  ),
  // There are no actual routes set
  routes: const {},
);

// Log in page route
final loggedOutRoutes = RouteMap(
  routes: {
    '/': (route) => const MaterialPage<void>(
          key: ValueKey('login'),
          child: LoginPage(),
        ),
  },
);

// Normal after-login routes
final loggedInRoutes = RouteMap(
  routes: {
    '/': (route) => const MaterialPage<void>(
          key: ValueKey('home'),
          child: HomePage(),
        ),
    '/article/:id': (route) => MaterialPage<void>(
          child: ArticlePage(id: route.pathParameters['id']!),
        ),
  },
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // App state keeps track of whether we're logged in
  final _appState = AppState();

  final RoutemasterDelegate _routemaster = RoutemasterDelegate(
    routesBuilder: (context) {
      // Return the correct routing map depending on the current login state
      switch (Provider.of<AppState>(context).loggedInState) {
        case LoggedInState.loading:
          return initializingRoutes;
        case LoggedInState.loggedOut:
          return loggedOutRoutes;
        case LoggedInState.loggedIn:
          return loggedInRoutes;
      }
    },
  );

  late final _notifications = Notifications(
    onNotificationSelected: (payload) => _routemaster.push(payload),
  );

  late final _linkHandler =
      LinkHandler(onLink: (link) => _routemaster.push(link))..init();

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  void _initApp() async {
    final launchPayload = await _notifications.init();
    await _appState.logIn();

    if (launchPayload != null &&
        _appState.loggedInState == LoggedInState.loggedIn) {
      _routemaster.replace(launchPayload);
    }
  }

  @override
  void dispose() {
    _linkHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _appState),
        Provider.value(value: _notifications),
        Provider(
          create: (_) => Api(
            onAuthFailure: () {
              _appState.logOut();
              _routemaster.replace('/');
            },
          ),
        )
      ],
      child: MaterialApp.router(
        routeInformationParser: const RoutemasterParser(),
        routerDelegate: _routemaster,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<Notifications>(context);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Home page',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Routemaster.of(context).push('/article/1');
            },
            child: const Text('Article 1'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Routemaster.of(context).push('/article/401');
            },
            child: const Text('Article 401 (auth fail)'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => notifications.showNotification(),
            child: const Text('Show notification now'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => notifications.scheduleNotification(),
            child: const Text('Show notification in 5 seconds'),
          ),
        ],
      ),
    );
  }
}
