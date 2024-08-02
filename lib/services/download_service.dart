final downloadService = DownloadService();

class DownloadService {
  bool success = false;

  late Future<bool> ready;

  void init() {
    ready = Future.delayed(const Duration(seconds: 3), () {
      success = true;
      return success;
    });
  }
}
