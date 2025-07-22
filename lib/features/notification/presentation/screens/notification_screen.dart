import 'package:flutter/material.dart';
import 'package:fuoday/commons/widgets/k_app_%20bar_with_drawer.dart';
import 'package:fuoday/commons/widgets/k_drawer.dart';
import 'package:fuoday/core/extensions/provider_extension.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final authEntity = context.employeeAuthLoginProviderWatch.authEntity;

    return Scaffold(
      key: _scaffoldKey,
      appBar: authEntity != null
          ? KAppBarWithDrawer(
              userName: authEntity.data.name,
              cachedNetworkImageUrl:
                  authEntity.data.employeeDetails.profilePhoto,
              userDesignation: authEntity.data.employeeDetails.designation,
              showUserInfo: false,
              onDrawerPressed: _openDrawer,
              onNotificationPressed: () {},
            )
          : null,

      drawer: KDrawer(),

      body: Center(child: Text("hi notification")),
    );
  }
}
