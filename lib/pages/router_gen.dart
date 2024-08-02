import 'package:go_router/go_router.dart';
import 'package:mobile_monitor_client/pages/branches/branches_nav_helper.dart';
import 'package:mobile_monitor_client/pages/home_page.dart';
import 'package:mobile_monitor_client/pages/normal/normal_page.dart';
import 'package:mobile_monitor_client/pages/normal/page_a.dart';
import 'package:mobile_monitor_client/pages/normal/page_b.dart';
import 'package:mobile_monitor_client/pages/normal/page_c.dart';
import 'package:mobile_monitor_client/pages/normal/page_d.dart';
import 'package:mobile_monitor_client/pages/normal/page_e.dart';
import 'package:mobile_monitor_client/pages/normal/page_f.dart';
import 'package:mobile_monitor_client/pages/normal/page_g.dart';
import 'package:mobile_monitor_client/pages/normal/page_h.dart';
import 'package:mobile_monitor_client/pages/normal/page_i.dart';
import 'package:mobile_monitor_client/pages/normal/page_j.dart';
import 'package:mobile_monitor_client/pages/normal/page_k.dart';
import 'package:mobile_monitor_client/pages/scan/scan_page.dart';

///
///
/// Home - A - B - E - F
///          - C - G
///              - H
///          - D - I - J - K
///      - Normal
///      - Scan
///      - Branches
///
///
buildGoRouter() => GoRouter(
      navigatorKey: BranchesNavHelper.parentNavigatorKey,
      routes: [
        GoRoute(
          name: homePage,
          path: homePage,
          builder: (_, __) => const MyHomePage(),
          routes: [
            GoRoute(
              name: scanPage,
              path: scanPage,
              builder: (_, __) => const ScanPage(),
            ),
            GoRoute(
              name: normalPage,
              path: normalPage,
              routes: [
                GoRoute(
                  name: pageA,
                  path: pageA,
                  builder: (_, __) => const PageA(),
                  routes: [
                    GoRoute(
                      name: pageB,
                      path: pageB,
                      builder: (_, __) => const PageB(),
                      routes: [
                        GoRoute(
                          name: pageE,
                          path: pageE,
                          builder: (_, __) => const PageE(),
                          routes: [
                            GoRoute(
                              name: pageF,
                              path: pageF,
                              builder: (_, __) => const PageF(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GoRoute(
                      name: pageC,
                      path: pageC,
                      builder: (_, __) => const PageC(),
                      routes: [
                        GoRoute(
                          name: pageG,
                          path: pageG,
                          builder: (_, __) => const PageG(),
                        ),
                        GoRoute(
                          name: pageH,
                          path: pageH,
                          builder: (_, __) => const PageH(),
                        ),
                      ],
                    ),
                    GoRoute(
                      name: pageD,
                      path: pageD,
                      builder: (_, __) => const PageD(),
                      routes: [
                        GoRoute(
                          name: pageI,
                          path: pageI,
                          builder: (_, __) => const PageI(),
                          routes: [
                            GoRoute(
                              name: pageJ,
                              path: pageJ,
                              builder: (_, __) => const PageJ(),
                              routes: [
                                GoRoute(
                                  name: pageK,
                                  path: pageK,
                                  builder: (_, __) => const PageK(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              builder: (_, __) => const NormalPage(),
            ),
            ...BranchesNavHelper.routes,
          ],
        )
      ],
      initialLocation: homePage,
    );
