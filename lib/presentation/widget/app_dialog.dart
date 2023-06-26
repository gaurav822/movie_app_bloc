import 'package:flutter/material.dart';
import 'button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget? image;

  const AppDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 32,
      insetPadding: EdgeInsets.all(32),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 4,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: 16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            // SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            if (image != null) image!,

            const SizedBox(height: 30,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: ()  {
                   _launchUrl('https://github.com/gaurav822');
                  },
                    child: const Icon(FontAwesomeIcons.github,color: Colors.white,)),
                GestureDetector(
                  onTap: (){
                    _launchUrl('https://www.linkedin.com/in/dahalgaurav/');
                  },
                    child: const Icon(FontAwesomeIcons.linkedin,color: Colors.blue,)),
                GestureDetector(
                  onTap: (){
                    _launchUrl('https://www.instagram.com/in/dahal_gaurav/');
                  },
                    child: const Icon(FontAwesomeIcons.instagram,color: Colors.redAccent,))
              ],
            ),

            const SizedBox(height: 20,),

            Button(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: buttonText,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}