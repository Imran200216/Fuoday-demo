import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fuoday/core/helper/app_logger_helper.dart';

class AppFileDownloaderProvider extends ChangeNotifier {
  bool _isDownloading = false;
  double? _progress;

  bool get isDownloading => _isDownloading;
  double? get progress => _progress;

  Future<void> downloadFile({
    required String url,
    VoidCallback? onCompleted,
    Function(String)? onError,
  }) async {
    _isDownloading = true;
    _progress = 0;
    notifyListeners();

    FileDownloader.downloadFile(
      url: url,
      onProgress: (fileName, progress) {
        _progress = progress;
        notifyListeners();
      },
      onDownloadCompleted: (filePath) {
        _isDownloading = false;
        _progress = null;
        AppLoggerHelper.logInfo('Download completed: $filePath');
        notifyListeners();
        if (onCompleted != null) onCompleted();
      },
      onDownloadError: (errorMessage) {
        _isDownloading = false;
        _progress = null;
        notifyListeners();
        if (onError != null) onError(errorMessage ?? "Unknown error");
      },
    );
  }
}
