import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/shared/style/bloc_observer.dart';
import 'package:furniture_store/shared/style/theme.dart';
import 'modules/user/login/login_screen.dart';


void main()  {


  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();


      runApp(MyApp(
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {

  MyApp({Key? key, Key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        // darkTheme: darkTheme,
        // themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
        home: LogingScreen(),
      );
  }
}
