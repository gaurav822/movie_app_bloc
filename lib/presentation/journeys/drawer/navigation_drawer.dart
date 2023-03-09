import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/common/constants/languages.dart';
import 'package:movie_app_bloc/data/core/app_color.dart';
import 'package:movie_app_bloc/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:movie_app_bloc/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movie_app_bloc/presentation/widget/logo.dart';
import 'package:movie_app_bloc/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:wiredash/wiredash.dart';

import '../../blocs/language_bloc/language_bloc.dart';


class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 4,color: Theme.of(context).primaryColor.withOpacity(0.7),)
        ]
      ),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20,bottom: 18,left: 8,right: 8),
              child: Logo(height: 20,),
            ),
            
            NavigationListItem(title: LocaleKeys.favouriteMovies.tr(), onPressed: (){}),
            NavigationExpandedListItem(title: LocaleKeys.language.tr(),
                onPressed: (index){
                  // context.setLocale(Locale(Language.languages[index].code,Language.languages[index].countryCode));
                  context.read<LanguageBloc>().changeLocale(Locale('en','US'));
                  // BlocProvider.of<LanguageBloc>(context).changeLocale(Locale(Language.languages[index].code));
            }, children: Language.languages),
            NavigationListItem(title: LocaleKeys.feedback.tr(),
                onPressed: (){
              Navigator.of(context).pop();
              Wiredash.of(context).show();
            }),
            NavigationListItem(title: LocaleKeys.about.tr(), onPressed: (){}),
          ],
        ),
      ),

    );
  }
}
