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

final toPageF = _buildPath([
  normalPage,
  pageA,
  pageB,
  pageE,
  pageF,
]);

final toPageB = _buildPath([
  normalPage,
  pageA,
  pageB,
]);

final toPageE = _buildPath([
  normalPage,
  pageA,
  pageB,
  pageE,
]);

final toPageG = _buildPath([
  normalPage,
  pageA,
  pageC,
  pageG,
]);

final toPageH = _buildPath([
  normalPage,
  pageA,
  pageC,
  pageH,
]);

final toPageK = _buildPath([
  normalPage,
  pageA,
  pageD,
  pageI,
  pageJ,
  pageK,
]);

final toPageI = _buildPath([
  normalPage,
  pageA,
  pageD,
  pageI,
]);

final toPageJ = _buildPath([
  normalPage,
  pageA,
  pageD,
  pageI,
  pageJ,
]);

_buildPath(List<String> routes) => '/${routes.join('/')}';
