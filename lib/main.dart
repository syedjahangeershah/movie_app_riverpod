import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/movie_flow/movie_flow.dart';
import 'theme/custom_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(baseUrl: "https://api.themoviedb.org/3/"),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.dark(context),
      home: const MovieFlow(),
    );
  }
}
