import 'package:bdp_payment_app/common/constants/global_constants.dart';
import 'package:bdp_payment_app/features/authentication/screens/kyc/kyc_setup.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/history.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/notification/notification.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/settings/settings.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/constants/general_repository.dart';
import 'features/authentication/screens/navigation_menu/navigation_menu_controller/navigation_controller.dart';
import 'features/mainscreens/screens/profile/profile_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {

  late NavigationMenuController controller;

  @override
  void initState() {
    checkIfKycHasBeenDone();
    controller = NavigationMenuController(context: context);
    controller.init();
    super.initState();
  }

  //handle login
  checkIfKycHasBeenDone() {
    var submittedData = GlobalConstants.storageService.getString(GeneralRepository.documentSubmitted);
    if (submittedData.isEmpty) {
      return Get.offAll(()=> const KYCSetup());
    }
  }
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