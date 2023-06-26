import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/common/constants/languages.dart';
import 'package:movie_app_bloc/domain/entities/language_entity.dart';
import 'package:movie_app_bloc/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app_bloc/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final Function onPressed;
  final List<LanguageEntity> children;
  const NavigationExpandedListItem({Key? key, required this.title, required this.onPressed, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 2,color: Theme.of(context).primaryColor.withOpacity(0.7))
          ]
      ),
      child: ExpansionTile(
        title: Text(title,style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white))),
        children: [
          for(int i=0;i<children.length;i++)
            NavigationSubListItem(
                title: tr('${children[i].value}'),
                onPressed: ()=>onPressed(i))
        ],

      ),
    );
  }
}
