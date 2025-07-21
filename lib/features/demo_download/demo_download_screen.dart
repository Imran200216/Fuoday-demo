import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/helper/app_logger_helper.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';

class DemoDownloadScreen extends StatefulWidget {
  const DemoDownloadScreen({super.key});

  @override
  State<DemoDownloadScreen> createState() => _DemoDownloadScreenState();
}

class _DemoDownloadScreenState extends State<DemoDownloadScreen> {
  // Controllers
  final TextEditingController urlController = TextEditingController();

  // Download progress
  bool _isDownloading = false;
  double? _progress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            KText(
              text: "Download any file from URL",
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColors.titleColor,
            ),

            KVerticalSpacer(height: 20.h),

            KAuthTextFormField(
              hintText: "Enter url",
              controller: urlController,
            ),

            KVerticalSpacer(height: 20.h),

            KAuthFilledBtn(
              isLoading: _isDownloading,
              text: "Download From Url",
              onPressed: () {
                setState(() {
                  _isDownloading = true;
                });

                FileDownloader.downloadFile(
                  url: urlController.text.trim(),
                  onProgress: (fileName, progress) {
                    setState(() {
                      _progress = progress;
                    });
                  },
                  onDownloadCompleted: (value) {
                    setState(() {
                      _isDownloading = false;
                      _progress = null;
                    });
                    AppLoggerHelper.logInfo('path $value');
                  },
                  onDownloadError: (errorMessage) {
                    setState(() {
                      _isDownloading = false;
                      _progress = null;
                    });
                    print("Download failed: $errorMessage");
                  },
                );
              },
            ),

            if (_progress != null)
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: KText(
                  text:
                      "Downloading: ${(_progress! * 100).toStringAsFixed(0)}%",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.titleColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
