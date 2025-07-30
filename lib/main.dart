import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:new_sakti_mobile/core.dart';

void main() async {
  await Setup.initialize();

  if (SessionDatabase.token.isNotEmpty) {
    ApiServiceAuth().getUserData();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MyBlocProvider.providers,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: newRouter,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1.0),
                ),
                child: child!,
              );
            },
            title: 'Sakti Mobile',
            debugShowCheckedModeBanner: false,
            theme: themeDataLight,
            darkTheme: themeDataDark,
            themeMode: state.themeMode,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            supportedLocales: const [
              Locale('id', 'ID'),
            ],
          );
        },
      ),
    );
  }
}
