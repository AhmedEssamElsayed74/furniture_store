import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/shared/style/bloc_observer.dart';
import 'package:furniture_store/shared/style/theme.dart';
import 'modules/user/splash screen/splash_screen.dart';


void main() {
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();


      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key, Key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ShopCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
