import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elements_api_sqlite/elements_api_sqlite.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDatabaseInitialized = prefs.getBool('isDatabaseInitialized') ?? false;

   if (!isDatabaseInitialized) {
    // Si la base de datos no ha sido inicializada, inicialízala
    ElementsApiSqlite databaseManager = ElementsApiSqlite();
    await databaseManager.initDatabase();
    // Marca la base de datos como inicializada en SharedPreferences
    await prefs.setBool('isDatabaseInitialized', true);
  }

  runApp(await builder());
}
