import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_monitor_client/pages/branches/branches_page.dart';
import 'package:mobile_monitor_client/pages/branches/detail_page.dart';
import 'package:mobile_monitor_client/pages/branches/home_page.dart';
import 'package:mobile_monitor_client/pages/branches/search_page.dart';
import 'package:mobile_monitor_client/pages/branches/setting_pages.dart';
import 'package:mobile_monitor_client/pages/branches/sign_in_page.dart';
import 'package:mobile_monitor_client/pages/branches/sign_up_page.dart';
import 'package:mobile_monitor_client/pages/normal/page_l.dart';

import '../normal/page_m.dart';
import '../normal/page_n.dart';

const pageBranchesRootDetail = 'pageBranchesRootDetail';

final class BranchesNavHelper {
  static final GlobalKey<NavigatorState> _parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _searchTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _settingsTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static get parentNavigatorKey => _parentNavigatorKey;

  static List<RouteBase> routes = [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _parentNavigatorKey,
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              name: pageBranchesHome,
              path: pageBranchesHome,
              pageBuilder: (context, GoRouterState state) {
                return _buildPage(
                  child: const HomePage(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _searchTabNavigatorKey,
          routes: [
            GoRoute(
              name: pageBranchesSearch,
              path: pageBranchesSearch,
              pageBuilder: (context, state) {
                return _buildPage(
                  child: const SearchPage(),
                  state: state,
                );
              },
              routes: [
                GoRoute(
                  name: pageL,
                  path: pageL,
                  pageBuilder: (context, state) {
                    return _buildPage(
                      child: const PageL(),
                      state: state,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsTabNavigatorKey,
          routes: [
            GoRoute(
              name: pageBranchesSettings,
              path: pageBranchesSettings,
              pageBuilder: (context, state) {
                return _buildPage(
                  child: const SettingsPage(),
                  state: state,
                );
              },
              routes: [
                GoRoute(
                  name: pageM,
                  path: pageM,
                  routes: [
                    GoRoute(
                      name: pageN,
                      path: pageN,
                      pageBuilder: (context, state) {
                        return _buildPage(
                          child: const PageN(),
                          state: state,
                        );
                      },
                    ),
                  ],
                  pageBuilder: (context, state) {
                    return _buildPage(
                      child: const PageM(),
                      state: state,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
      pageBuilder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) =>
          _buildPage(
        child: BranchesPage(
          child: navigationShell,
        ),
        state: state,
      ),
    ),
    GoRoute(
      parentNavigatorKey: _parentNavigatorKey,
      name: pageBranchesSignUp,
      path: pageBranchesSignUp,
      pageBuilder: (context, state) {
        return _buildPage(
          child: const SignUpPage(),
          state: state,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _parentNavigatorKey,
      name: pageBranchesSignIn,
      path: pageBranchesSignIn,
      pageBuilder: (context, state) {
        return _buildPage(
          child: const SignInPage(),
          state: state,
        );
      },
    ),
    GoRoute(
      name: pageBranchesDetail,
      path: pageBranchesDetail,
      pageBuilder: (context, state) {
        return _buildPage(
          child: const DetailPage(),
          state: state,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _parentNavigatorKey,
      name: pageBranchesRootDetail,
      path: pageBranchesRootDetail,
      pageBuilder: (context, state) {
        return _buildPage(
          child: const DetailPage(),
          state: state,
        );
      },
    ),
  ];

  static Page _buildPage({
    required Widget child,
    required GoRouterState state,
  }) =>
      MaterialPage(
        key: state.pageKey,
        child: child,
      );
}
