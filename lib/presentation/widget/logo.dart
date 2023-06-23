import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../blocs/language_bloc/language_bloc.dart';

class Logo extends StatelessWidget{
  final double height;

  const Logo({super.key,
    required this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        BlocProvider.of<LanguageBloc>(context).changeLocale(Locale('ne','NP'));
        // context.read<LanguageBloc>().changeLocale(Locale('en','US'));
      },
      child: Image.asset(
          'assets/pngs/logo.png',
        color: Colors.white,
        height:50,
      ),
    );
  }

}