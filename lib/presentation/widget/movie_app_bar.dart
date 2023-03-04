import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_bloc/presentation/widget/logo.dart';
import 'package:easy_localization/easy_localization.dart';


class MovieAppbar extends StatelessWidget {
  const MovieAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: (){
                    context.setLocale(Locale('ne','NP'));
                  Scaffold.of(context).openDrawer();
                }, icon: SvgPicture.asset('assets/svgs/menu.svg',height: 30,),),
                const Expanded(child: Logo(height: 14)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.white,size: 30,))
              ],
            ),
    );
  }
}
