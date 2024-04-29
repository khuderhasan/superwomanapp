import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'presentation/providers/user_type_provider.dart';
import 'data/datasourse/admin_datasource.dart';
import 'data/datasourse/content_datasource.dart';
import 'data/repository/admin_repository.dart';
import 'data/repository/content_repository.dart';
import 'presentation/cubits/admin/admin_cubit.dart';
import 'presentation/cubits/content/content_cubit.dart';

import 'config/constants.dart';
import 'config/routes.dart';
import 'data/datasourse/auth_datasource.dart';
import 'data/datasourse/chat_datasource.dart';
import 'data/datasourse/woman_datasource.dart';
import 'data/repository/auth_repository.dart';
import 'data/repository/chat_repository.dart';
import 'data/repository/woman_repository.dart';
import 'firebase_options.dart';
import 'presentation/cubits/auth/auth_cubit.dart';
import 'presentation/cubits/chat/chat_cubit.dart';
import 'presentation/cubits/doctors/doctors_cubit.dart';
import 'presentation/cubits/woman/woman_cubit.dart';
import 'presentation/providers/navigation_provider.dart';
import 'presentation/screens/register/signup/account_type_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavProvider>(create: (context) => NavProvider()),
        ChangeNotifierProvider<UserType>(create: (context) => UserType()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AdminCubit>(
            create: (context) => AdminCubit(
                repository: AdminRepository(dataSource: AdminDataSource())),
          ),
          BlocProvider<ContentCubit>(
            create: (context) => ContentCubit(
                repository: ContentRepository(dataSource: ContentDataSource())),
          ),
          BlocProvider<WomanCubit>(
            create: (context) => WomanCubit(
                repository: WomanRepository(datasource: WomanDatasource())),
          ),
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(
                authRepository: AuthRepository(dataSource: AuthDataSource())),
          ),
          BlocProvider<ChatCubit>(
            create: (context) => ChatCubit(
                chatRepository: ChatRepository(dataSource: ChatDataSource())),
          ),
          BlocProvider<DoctorsCubit>(
            create: (context) => DoctorsCubit(
                chatRepository: ChatRepository(dataSource: ChatDataSource())),
          )
        ],
        child: MaterialApp(
          title: 'Super Woman',
          locale: const Locale('en'),
          localeListResolutionCallback: (locales, supportedLocales) =>
              const Locale('en'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: const AccountTypeScreen(),
          routes: routes,
        ),
      ),
    );
  }
}
