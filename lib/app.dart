import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class BandNamesApp extends StatelessWidget {
  const BandNamesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BandNamesApp',
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
