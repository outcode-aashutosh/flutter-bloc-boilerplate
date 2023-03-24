import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc_demo/config/app_config.dart';
import 'package:bloc_demo/injector/injector.dart';

import 'boiler_plate_app.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    AppConfig.configDev();
    Injector.init();
    await Injector.instance.allReady();

    runApp(const BoilerPlateApp());
  }, (error, stack) {
    log(error.toString());
  });
}
