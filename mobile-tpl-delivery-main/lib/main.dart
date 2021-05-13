import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Auth/login_navigator.dart';
import 'Controllers/map.dart';
import 'Locale/language_cubit.dart';
import 'Locale/locale.dart';
import 'Routes/routes.dart';
import 'Theme/style.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(Phoenix(child: DoctoDelivery()));
}

class DoctoDelivery extends StatelessWidget {
  final MapController map = Get.put(MapController());
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageCubit>(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (_, locale) {
          return GetMaterialApp(
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('ar'),
              const Locale('pt'),
              const Locale('fr'),
              const Locale('id'),
              const Locale('es'),
            ],
            locale: locale,
            theme: appTheme,
            home: LoginNavigator(),
            routes: PageRoutes().routes(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
