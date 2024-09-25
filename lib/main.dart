import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(MainApp(appRouter: AppRouter(),));
}

class MainApp extends StatelessWidget {
  final AppRouter appRouter;

  const MainApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       onGenerateRoute: appRouter.generateRoute,
    );
  }
}
