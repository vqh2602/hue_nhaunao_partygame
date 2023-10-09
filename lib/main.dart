import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hue_nhaunao_partygame/c_lang/c_translations.dart';
import 'package:hue_nhaunao_partygame/c_theme/c_theme.dart';
import 'package:hue_nhaunao_partygame/config/config.dart';
import 'package:hue_nhaunao_partygame/config/get_config.dart';
import 'package:hue_nhaunao_partygame/init.dart';
import 'package:hue_nhaunao_partygame/routers.dart';
Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Env.config = await getConfigBase();

  await initialize();
  runApp(
    Phoenix(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      locale: Get.deviceLocale ?? const Locale('vi', 'VN'),
      translations: Messages(),
      navigatorObservers: const [
        // firebaseAnalyticsService.appAnalyticsObserver(),
      ],
      fallbackLocale: const Locale('vi', 'VN'),
      theme: SThemeTask.lightTheme,
      darkTheme: SThemeTask.darkTheme,
      themeMode: ThemeService().theme,
      // builder: (context, child) {
      //   ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      //     return CustomError(errorDetails: errorDetails);
      //   };
      //   return MediaQuery(
      //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      //     // textDirection: AppTheme.textDirection,
      //     child: child!,
      //   );
      // },
      localizationsDelegates: const [
        // Add this line
        // GlobalMaterialLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
      ],
      //supportedLocales: const [Locale('vn'),Locale('u')],
      transitionDuration: const Duration(milliseconds: 300),
      defaultTransition: Transition.fadeIn,
      //  initialRoute: LoginScreen.routeName,
      initialRoute: '',
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
