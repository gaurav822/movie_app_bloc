import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_bloc/data/core/app_color.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  const TabTitleWidget({Key? key, required this.title, required this.onTap, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
              border: Border(
            bottom: BorderSide(
              color: isSelected?AppColor.royalBlue:Colors.transparent,
              width: 1
            )
        )
        ),
        child: Text(title,style: TextStyle(
          fontSize: 18,
          color: isSelected?AppColor.royalBlue:Colors.white
        ),),
      ),
    );
  }
}
