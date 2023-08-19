import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/routes.dart';
import 'package:quizapp/services/firestore.dart';
import 'package:quizapp/services/models.dart';
import 'package:quizapp/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (_) => FirestoreService().streamReport(),
      initialData: Report(),
      child: MaterialApp(
        routes: appRoutes,
        title: 'Flutter Demo',
        theme: appTheme,
      ),
    );
  }
}
