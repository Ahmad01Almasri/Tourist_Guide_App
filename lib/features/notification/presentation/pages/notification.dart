import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../data/models/notification_model.dart';
import '../widgets/card_notification.dart';
import '../widgets/switch_read_unread.dart';
import '../../../../core/widgets/custom_top_page_bar.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late ValueNotifier<bool> _showReadNotifications;
  late ValueNotifier<int> _selectedTabIndex;

  final List<NotificationItem> _notifications = [
    NotificationItem(
      title: 'Notification 1',
      message: 'This is notification 1',
      read: true,
    ),
    NotificationItem(
      title: 'Notification 2',
      message: 'This is notification 2',
      read: false,
    ),
    NotificationItem(
      title: 'Notification 3',
      message: 'This is notification 3',
      read: true,
    ),
    NotificationItem(
      title: 'Notification 4',
      message: 'This is notification 4',
      read: false,
    ),
    NotificationItem(
      title: 'Notification 5',
      message: 'This is notification 5',
      read: false,
    ),
    NotificationItem(
      title: 'Notification 6',
      message: 'This is notification 6',
      read: false,
    ),
    NotificationItem(
      title: 'Notification 7',
      message: 'This is notification 7',
      read: false,
    ),
    NotificationItem(
      title: 'Notification 8',
      message: 'This is notification 8',
      read: false,
    ),
    NotificationItem(
      title: 'Notification 9',
      message: 'This is notification 9',
      read: false,
    ),
    NotificationItem(
      title: 'Notification 10',
      message: 'This is notification 10',
      read: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _showReadNotifications = ValueNotifier<bool>(true);
    _selectedTabIndex = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    _showReadNotifications.dispose();
    _selectedTabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomTopPageBar(
              pageName: AppStrings.notifications,
            ),
            const SizedBox(height: 30),
            SwitchButtonReadUnRead(
                selectedTabIndex: _selectedTabIndex,
                showReadNotifications: _showReadNotifications),
            const SizedBox(height: 30),
            Expanded(
              child: ValueListenableBuilder<bool>(
                valueListenable: _showReadNotifications,
                builder: (context, showRead, _) {
                  return ListView.builder(
                    itemCount: _notifications.length,
                    itemBuilder: (context, index) {
                      final notification = _notifications[index];
                      if (showRead && !notification.read) {
                        return const SizedBox.shrink();
                      } else if (!showRead && notification.read) {
                        return const SizedBox.shrink();
                      }
                      return CardNotificationItem(notification: notification);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
