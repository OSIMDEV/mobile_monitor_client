import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_monitor_client/pages/example/mobile_app/pages/login_page.dart';
import 'package:mobile_monitor_client/pages/others/routemaster.dart';
import 'package:provider/provider.dart';

import 'app_state/app_state.dart';
import 'custom_page.dart';
import 'pages/bottom_navigation_bar_page.dart';
import 'pages/bottom_sheet.dart';
import 'pages/feed_page.dart';
import 'pages/home_page.dart';
import 'pages/notifications_page.dart';
import 'pages/search_page.dart';
import 'pages/settings_page.dart';
import 'pages/tab_bar_page.dart';

mobileAppMain() {
  Routemaster.setPathUrlStrategy();
  return const MyApp();
}

/// Title observer that updates the app's title when the route changes
/// This shows in a browser tab's title.
class TitleObserver extends RoutemasterObserver {
  @override
  void didChangeRoute(RouteData routeData, Page<dynamic> page) {
    if (page.name != null) {
      SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
          label: page.name,
          primaryColor: 0xFF00FF00,
        ),
      );
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'Routemaster Demo',
            routeInformationParser: RoutemasterParser(),
            routerDelegate: RoutemasterDelegate(
              observers: [TitleObserver()],
              routesBuilder: (context) {
                // We swap out the routing map at runtime based on app state
                final appState = Provider.of<AppState>(context);
                final isLoggedIn = appState.isLoggedIn;
                return isLoggedIn
                    ? _buildRouteMap(appState)
                    : loggedOutRouteMap;
              },
            ),
          );
        },
      ),
    );
  }
}

// This is the logged out route map.
// This only allows the user to navigate to the root path.
// Note: building the route map from methods allows hot reload to work
final loggedOutRouteMap = RouteMap(
  onUnknownRoute: (route) => const Redirect('/'),
  routes: {
    '/': (_) => const MaterialPage(child: LoginPage()),
  },
);

// This is the real route map - used if the user is logged in.
RouteMap _buildRouteMap(AppState appState) {
  return RouteMap(
    routes: {
      '/': (_) => CupertinoTabPage(
            pageBuilder: (child) => MaterialWithModalsPage(child: child),
            child: const HomePage(),
            paths: [
              '/feed',
              '/search',
              if (appState.showBonusTab) '/bonus',
              '/notifications',
              '/settings',
            ],
            backBehavior: TabBackBehavior.none,
          ),
      '/feed': (_) => const MaterialPage(
            name: 'Feed',
            child: FeedPage(),
          ),
      '/feed/profile/:id': (info) {
        if (info.pathParameters['id'] == '1' ||
            info.pathParameters['id'] == '2') {
          return MaterialPage(
            name: 'Profile',
            child: ProfilePage(
              id: info.pathParameters['id'],
              message: info.queryParameters['message'],
            ),
          );
        }

        return const Redirect('/feed');
      },
      '/feed/profile/:id/photo': (info) => FancyAnimationPage(
            child: PhotoPage(id: info.pathParameters['id']),
          ),

      '/search': (_) => const MaterialPage(
            name: 'Search',
            child: SearchPage(),
          ),
      '/settings': (_) => const MaterialPage(
            name: 'Settings',
            child: SettingsPage(),
          ),

      // Most pages tend to appear only in one place in the app
      // However sometimes you can push them into multiple places.
      '/search/hero': (_) => const MaterialPage(child: HeroPage()),
      '/settings/hero': (_) => const MaterialPage(child: HeroPage()),

      // This gets really complicated to test out tested scenarios!
      '/notifications': (_) => const IndexedPage(
            child: NotificationsPage(),
            paths: ['one', 'two'],
          ),
      '/notifications/one': (_) => const MaterialPage(
            name: 'Notifications - One',
            child: NotificationsContentPage(
              message: 'Page one',
            ),
          ),
      '/notifications/two': (_) => const MaterialPage(
            name: 'Notifications - Two',
            child: NotificationsContentPage(message: 'Page two'),
          ),
      '/notifications/pushed': (_) => const MaterialPage(
            child: MessagePage(message: 'Pushed notifications'),
          ),
      '/tab-bar': (_) => TabPage(
            child: const TabBarPage(),
            paths: [
              'one',
              if (appState.showBonusTab) 'bonus',
              'settings',
            ],
          ),
      '/tab-bar/one': (_) =>
          const MaterialPage(child: MessagePage(message: 'One')),
      '/tab-bar/bonus': (_) => const MaterialPage(
            child: MessagePage(message: 'BONUS!!'),
          ),
      '/tab-bar/settings': (_) => const MaterialPage(child: SettingsPage()),
      '/bottom-navigation-bar-replace': (_) => const MaterialPage(
            child: BottomNavigationBarReplacementPage(),
          ),
      '/bottom-navigation-bar': (_) => const IndexedPage(
            child: BottomNavigationBarPage(),
            paths: ['one', 'two', 'three'],
          ),
      '/bottom-navigation-bar/one': (_) => const MaterialPage(
            child: BottomContentPage(),
          ),
      '/bottom-navigation-bar/two': (_) => const MaterialPage(
            child: BottomContentPage2(),
          ),
      '/bottom-navigation-bar/three': (_) => const MaterialPage(
            child: MessagePage(message: 'Page three'),
          ),
      '/bottom-navigation-bar/threepage': (_) => const MaterialPage(
            child: DoubleBackPage(),
          ),
      '/bottom-navigation-bar/replaced': (_) => const MaterialPage(
            child: MessagePage(message: 'Replaced'),
          ),
      '/bonus': (_) => const MaterialPage(
            child: MessagePage(message: 'You found the bonus page!!!'),
          ),

      '/stack': (_) => StackPage(
            pageBuilder: (child) => BottomSheetPage(child: child),
            child: const StackBottomSheetContents(),
            defaultPath: 'one',
          ),

      '/stack/one': (_) => const MaterialPage(child: StackPageOne()),
      '/stack/one/two': (_) => const MaterialPage(child: StackPageTwo()),

      '/custom-transitions': (_) => const CustomPage(
            child: MessagePage(message: 'Custom transitions'),
          ),
    },
  );
}

// For custom animations, just use the existing Flutter [Page] and [Route] objects
class FancyAnimationPage<T> extends Page<T> {
  final Widget child;

  const FancyAnimationPage({required this.child});

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: 0.0, end: 1.0);
        final curveTween = CurveTween(curve: Curves.easeInOut);

        return FadeTransition(
          opacity: animation.drive(curveTween).drive(tween),
          child: child,
        );
      },
    );
  }
}
