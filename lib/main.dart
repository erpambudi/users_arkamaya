import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/styles/app_theme.dart';
import 'core/flavors/environment.dart';
import 'core/routes/routes.dart';
import 'injection.dart' as di;
import 'presentation/bloc/manage_user_bloc.dart';
import 'presentation/bloc/user_detail_bloc.dart';
import 'presentation/bloc/users_bloc.dart';
import 'presentation/pages/main_page.dart';

void main() {
  di.init();

  env(Environment.production);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersBloc>(
          create: (context) => di.locator<UsersBloc>()..add(GetUsersEvent()),
        ),
        BlocProvider<UserDetailBloc>(
          create: (context) => di.locator<UserDetailBloc>(),
        ),
        BlocProvider<ManageUserBloc>(
          create: (context) => di.locator<ManageUserBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Users Arkamaya',
        theme: AppTheme.light(),
        home: const MainPage(),
        onGenerateRoute: ((settings) {
          return AppRoutes.routes(settings);
        }),
      ),
    );
  }
}
