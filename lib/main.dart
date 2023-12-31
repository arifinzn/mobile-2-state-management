import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc_pattern/pages/bloc_page.dart';
import 'package:state_management/get_it/pages/get_it_page.dart';
import 'package:state_management/getx/pages/getx_page.dart';
import 'package:state_management/mobx/pages/mobx_page.dart';
import 'package:state_management/provider/pages/provider_page.dart';
import 'package:state_management/repository/login_repository.dart';

import 'bloc_pattern/bloc/login_bloc.dart';
import 'layouts/homepage.dart';
import 'riverpod/pages/riverpod_page.dart';
import 'rx_bloc/pages/bloc_page.dart';

void main() => runApp(MyApp());

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => LoginRepository(),
          ), // RepositoryProvider,
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  LoginBloc(loginRepository: context.read<LoginRepository>())
                    ..add(const InitLogin()),
            ), // BlocProvider
          ],
          child: HomePage(),
        ), // MultiBlocProvider ), // MultiRepositoryProvider
      ), // MultiBlocProvider ), // MultiRepositoryProvider
    ); // MaterialApp
  }
}
