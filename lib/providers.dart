import 'package:core/core.dart';

class MyBlocProvider {
  static dynamic providers = [
    BlocProvider(
      create: (context) => ThemeBloc(),
    ),
  ];
}
