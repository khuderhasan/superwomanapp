import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../../../config/routes.dart';
import '../../providers/navigation_provider.dart';

class AdminMainScreen extends StatelessWidget {
  const AdminMainScreen({super.key});
  static const routeName = '/admin_main_screen';

  @override
  Widget build(BuildContext context) {
    void selectPage(int index) {
      Provider.of<NavProvider>(context, listen: false).currentIndex = index;
    }

    return Scaffold(
      body: adminPages[Provider.of<NavProvider>(context, listen: false)
          .currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<NavProvider>(context).currentIndex,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
                height: defaultPadding * 1.5,
                width: defaultPadding * 1.5,
                child: Image.asset('assets/icons/home_icon.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: defaultPadding * 1,
                width: defaultPadding * 1,
                child: Image.asset('assets/icons/profile_icon.png')),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
