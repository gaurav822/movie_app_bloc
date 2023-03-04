import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_bloc/common/constants/languages.dart';
import 'package:movie_app_bloc/data/core/app_color.dart';
import 'package:movie_app_bloc/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:movie_app_bloc/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movie_app_bloc/presentation/widget/logo.dart';
import 'package:movie_app_bloc/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';


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
            NavigationExpandedListItem(title: LocaleKeys.language.tr(), onPressed: (){}, children: Language.languages.map((e) => e.value).toList()),
            NavigationListItem(title: LocaleKeys.feedback.tr(), onPressed: (){}),
            NavigationListItem(title: LocaleKeys.about.tr(), onPressed: (){}),
          ],
        ),
      ),

    );
  }
}
