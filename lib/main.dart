import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movie_app_bloc/data/core/app_color.dart';
import 'package:movie_app_bloc/data/tables/movie_table.dart';
import 'package:movie_app_bloc/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app_bloc/presentation/journeys/home/home_screen.dart';
import 'package:movie_app_bloc/di/get_it.dart' as getIt;
import 'package:easy_localization/easy_localization.dart';
import 'package:movie_app_bloc/presentation/wiredash_app.dart';
import 'dart:async';

import 'package:movie_app_bloc/translations/codegen_loader.g.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'common/constants/languages.dart';

Future<void> main() async {
  // ApiClient client = ApiClient(Dio()..options.headers=ApiConstants.header);
  // MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(client);
  // MovieRepository repository = MovieRepositoryImpl(dataSource);
  // // repository.getTrending();
  // GetTrending getTrending = GetTrending(repository);
  // getTrending(NoParams());
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MovieTableAdapter());
  unawaited(getIt.init());
  // GetTrending getTrending = getIt.getInstance<GetTrending>();
  // getTrending(NoParams());
  runApp(EasyLocalization(
      supportedLocales: const [Locale('ne', 'NP'),Locale('en', 'US')],
      fallbackLocale: const Locale('ne', 'NP'),
      // startLocale:const Locale('en', 'US') ,
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getIt.getInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LanguageBloc(),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if(state is LanguageLoadedState){
            return WireDashApp(
              child: MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  scaffoldBackgroundColor: AppColor.vulcan,
                  primaryColor: AppColor.vulcan,
                  appBarTheme: const AppBarTheme(elevation: 0,color: Color(0xFF141221)),
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    secondary: AppColor.royalBlue, // Your accent color
                  ),
                  textTheme: Theme
                      .of(context)
                      .textTheme
                      .apply(
                    bodyColor: Colors.white, //<-- SEE HERE
                    displayColor: Colors.white, //<-- SEE HERE
                  ),
                ),
                supportedLocales: context.supportedLocales,
                locale: state.locale,
                localizationsDelegates: context.localizationDelegates,
                debugShowCheckedModeBanner: false,
                home: const HomeScreen(),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
