import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class NavigationListItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const NavigationListItem({Key? key, required this.title, required this.onPressed}) : super(key: key);

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
        child: ListTile(
          title: Text(title,style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white))),

        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const NavigationSubListItem({Key? key, required this.title, required this.onPressed}) : super(key: key);

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
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 32),
          title: Text(title,style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white))),

        ),
      ),
    );
  }
}
