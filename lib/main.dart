import 'package:flutter/material.dart';
import 'package:movie_app_bloc/data/core/app_color.dart';
import 'package:movie_app_bloc/presentation/journeys/home/home_screen.dart';
import 'package:movie_app_bloc/di/get_it.dart' as getIt;
import 'package:easy_localization/easy_localization.dart';
import 'package:code_builder/code_builder.dart';
import 'dart:async';

import 'package:movie_app_bloc/translations/codegen_loader.g.dart';

Future<void> main() async{
   // ApiClient client = ApiClient(Dio()..options.headers=ApiConstants.header);
   // MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(client);
   // MovieRepository repository = MovieRepositoryImpl(dataSource);
   // // repository.getTrending();
   // GetTrending getTrending = GetTrending(repository);
   // getTrending(NoParams());
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  unawaited(getIt.init());
  // GetTrending getTrending = getIt.getInstance<GetTrending>();
  // getTrending(NoParams());
  runApp(EasyLocalization(
      fallbackLocale: Locale('en', 'US'),
      supportedLocales: [Locale('en', 'US'), Locale('ne', 'NP')],
  path: 'assets/translations',
  assetLoader: CodegenLoader(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColor.royalBlue, // Your accent color
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white, //<-- SEE HERE
          displayColor: Colors.white, //<-- SEE HERE
        ),
      ),
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
