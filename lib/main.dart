import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:app/models/item_data.dart';
import 'package:app/models/theme_data.dart';
import 'package:app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await themeData().createShare();
  await ItemData().crateShare();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemData>(
            create: (BuildContext context) => ItemData()),
        ChangeNotifierProvider<themeData>(
            create: (BuildContext context) => themeData())
      ],
      child: const MyApp(),
    ),
  );
}

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      onAnimationEnd: () {
        debugPrint("On Fade In End");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const HomePage(title: 'Flutter Demo Home Page')),
        );
      },
      childWidget: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset("assets/bird.jpg"),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<themeData>(context, listen: false).loadShare();
    Provider.of<ItemData>(context).loadData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<themeData>(context).getselect,
      home: const MySplashScreen(),
    );
  }
}
