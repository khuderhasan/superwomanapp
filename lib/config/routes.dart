import 'package:super_woman/presentation/screens/woman/chat_bot/chat_bot_screen.dart';

import '../presentation/screens/content/fetus_changes/fetus_changes_home.dart';

import '../presentation/screens/admin/admin_main_screen.dart';
import '../presentation/screens/admin/all_users/all_users_screen.dart';
import '../presentation/screens/admin/home/admin_home_screen.dart';
import '../presentation/screens/content/content_home_sceen.dart';
import '../presentation/screens/content/health_system_screen.dart';
import '../presentation/screens/content/instructions_screen.dart';

import '../presentation/screens/woman/menstrual_cycle_info/menstrual_cycle_screen.dart';

import '../presentation/screens/doctor/chats/doctor_recent_chats.dart';

import '../presentation/screens/doctor/doctor_home_screen.dart';
import '../presentation/screens/doctor/doctor_main_screen.dart';
import '../presentation/screens/woman/chats/woman_recent_chats.dart';
import '../presentation/screens/register/Login/login_screen.dart';
import '../presentation/screens/register/signup/account_type_screen.dart';
import '../presentation/screens/woman/home/woman_home.dart';
import '../presentation/screens/woman/info/woman_info_screen.dart';
import '../presentation/screens/woman/profile/woman_profile.dart';
import '../presentation/screens/woman/woman_main_screen.dart';

final routes = {
  AccountTypeScreen.routeName: (context) => const AccountTypeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  WomanMainScreen.routeName: (context) => const WomanMainScreen(),
  DoctorMainScreen.routeName: (context) => const DoctorMainScreen(),
  MenstrualCylceScreen.routeName: (context) => const MenstrualCylceScreen(),
  ConetentHomeScreen.routeName: (context) => const ConetentHomeScreen(),
  InstructionsScreen.routeName: (context) => const InstructionsScreen(),
  HealthSystemScreen.routeName: (context) => const HealthSystemScreen(),
  AdminMainScreen.routeName: (context) => const AdminMainScreen(),
  AllUsersScreen.routeName: (context) => const AllUsersScreen(),
  FetusChangesHome.routeName: (context) => const FetusChangesHome(),
  ChatBotScreen.routeName: (context) => const ChatBotScreen()
};

final List<Map<String, dynamic>> womanPages = [
  {
    'page': const WomanHomeScreen(),
    'title': 'Home',
  },
  {
    'page': const WomanInfoScreen(),
    'title': 'Info',
  },
  {
    'page': const RecentChatsScreen(),
    'title': 'Messages',
  },
  {
    'page': const WomanProfileScreen(),
    'title': 'Profile',
  },
];
final List<Map<String, dynamic>> doctorPages = [
  {
    'page': const DoctorHomeScreen(),
    'title': 'Home',
  },
  {
    'page': const DoctorRecentChatsScreen(),
    'title': 'Messages',
  },
  {
    'page': const WomanProfileScreen(),
    'title': 'Profile',
  },
];
final List<Map<String, dynamic>> adminPages = [
  {
    'page': const AdminHomeScreen(),
    'title': 'Home',
  },
  {
    'page': const WomanProfileScreen(),
    'title': 'Profile',
  },
];
