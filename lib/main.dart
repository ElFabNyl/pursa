import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/email_exist_page.dart';
import 'package:pursa/screens/authentification/sign%20up%20with%20email/email_input.dart';
import 'package:pursa/screens/splash/splash_bitcoin_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'helpers/init_controllers.dart';

void main()  {
  
  //this is related to the splash screen we preserve it till the whole app
  //is setup
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // whenever your initialization is completed, remove the splash screen:
    FlutterNativeSplash.remove();
    return  GetMaterialApp(
      initialBinding: InitializeDepedencies(),
      debugShowCheckedModeBanner: false,
      home: EmailInputScreen(),
    );
  }
}
