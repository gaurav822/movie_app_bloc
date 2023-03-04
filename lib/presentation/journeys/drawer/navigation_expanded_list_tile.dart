import 'package:flutter/material.dart';
import 'package:movie_app_bloc/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final List<String> children;
  const NavigationExpandedListItem({Key? key, required this.title, required this.onPressed, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 2,color: Theme.of(context).primaryColor.withOpacity(0.7))
            ]
        ),
        child: ExpansionTile(
          title: Text(title,style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white))),
          children: [
            for(int i=0;i<children.length;i++)
              NavigationSubListItem(title: children[i], onPressed: (){})
          ],

        ),
      ),
    );
  }
}
