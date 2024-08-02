import 'dart:async';

class StackMonitor {
  StackMonitor.duration(this.duration);

  final int duration;

  bool _started = false;
  bool _resumed = false;

  late Timer _timer;

  final _actionableList = <IActionable>[];

  void register(IActionable actionable) {
    _actionableList.add(actionable);
  }

  void unregister(IActionable actionable) {
    _actionableList.remove(actionable);
  }

  void start() {
    if (!_started) {
      _timer = Timer.periodic(Duration(seconds: duration), _run);
      _resumed = true;
      _started = true;
    }
  }

  void resume() {
    _resumed = true;
  }

  void pause() {
    _resumed = false;
  }

  void stop() {
    if (_started) {
      _actionableList.clear();
      _timer.cancel();
      _resumed = false;
      _started = false;
    }
  }

  void _run(Timer timer) {
    if (_started && _resumed) {
      for (final e in _actionableList) {
        try {
          e.action();
        } catch (e) {}
      }
    }
  }
}

abstract class IActionable {
  void action();
}
