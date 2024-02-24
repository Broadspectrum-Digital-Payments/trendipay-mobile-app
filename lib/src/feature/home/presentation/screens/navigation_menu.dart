import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/feature/history/presentation/screens/history_screen.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/notification/notification.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/common.dart';
import '../../../../../core/routing/app_navigator.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../loans/presentation/screens/loans_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../view_models/bottom_nav_view_model.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {

  final _widgetOptions = const <Widget>[
    WalletScreen(),
    HistoryScreen(),
    NotificationScreen(),
    LoansScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleKycNavigation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavViewModel>(
      builder: (context, bottomNavConsumer, child) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: bottomNavConsumer.getSelectedNavTab,
            onDestinationSelected: (index) => bottomNavConsumer.selectNavTab = index,
            destinations: const[
              NavigationDestination(icon: Icon(Icons.wallet), label: 'Wallet'),
              NavigationDestination(icon: Icon(Icons.history), label: 'History'),
              NavigationDestination(icon: Icon(Icons.notifications_none), label: 'Notification'),
              NavigationDestination(icon: Icon(Icons.money), label: 'Loans'),
              NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile')
            ],
          ),
          body: _widgetOptions.elementAt(bottomNavConsumer.getSelectedNavTab),
        );
      }
    );
  }

  void _handleKycNavigation() async{
    await Future.delayed(const Duration(milliseconds: 100));
    if(!mounted) return;
    if([kQueuedStatus, kStartedStatus].contains(context.read<UserViewModel>().getUser.getKycStatus)){
      AppNavigator.pushNamed(context, AppRoute.kycSetupScreen);
      return;
    }
  }

}
