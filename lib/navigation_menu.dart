import 'package:bdp_payment_app/features/mainscreens/screens/history/history.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/notification/notification.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/settings/settings.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/mainscreens/screens/profile/profile_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex .value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.wallet), label: 'Wallet'),
            NavigationDestination(icon: Icon(Icons.history), label: 'History'),
            NavigationDestination(icon: Icon(Icons.notifications_none), label: 'Notification'),
            NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Setting'),
            NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile')
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const WalletScreen(),
    const HistoryScreen(),
    const NotificationScreen(),
    const SettingsScreen(),
    const ProfileScreen(),
  ];
}