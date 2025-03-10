import 'package:flutter/material.dart';
import 'package:myapp/database/habit_database.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HabitDatabase.init(); //waha initialize hai
  await HabitDatabase().saveFirstLaunchDate();

  runApp(
    MultiProvider(providers: [

      ChangeNotifierProvider(create: (context) => HabitDatabase()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
    ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
