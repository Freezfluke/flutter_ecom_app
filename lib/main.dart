import 'package:first_app/src/login/login_page.dart';
import 'package:first_app/src/register/register_page.dart';
import 'package:first_app/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        initialRoute: 'login',
        debugShowCheckedModeBanner: false,
        routes: {
          'login': (BuildContext context) => const LoginPage(),
          'register': (BuildContext context) => const Register()
        },
        theme: ThemeData(
          fontFamily: 'Capybara',
          textTheme: TextTheme(
              titleMedium: const TextStyle(fontSize: 18),
              bodyMedium: const TextStyle(fontSize: 18),
              bodyLarge: TextStyle(
                color: MyColors.primaryColor,
                fontSize: 18,
              )),
          primaryColor: MyColors.primaryColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: MyColors.primaryColor,
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                  color: MyColors.primaryColor,
                  width: 1.0), // Input field focused border
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                  color: MyColors.primaryColor,
                  width: 1.0), // Input field focused border
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                  color: MyColors.primaryColor,
                  width: 2.0), // Input field focused border
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20, fontFamily: 'Capybara'),
              backgroundColor: MyColors.primaryColor,
              foregroundColor: MyColors.white,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ));
  }
}
