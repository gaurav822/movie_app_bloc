import 'package:flutter/cupertino.dart';
import 'package:movie_app_bloc/data/core/app_color.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 80,
      padding: const EdgeInsets.only(
        top: 2,
        bottom: 6
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(1)),
        gradient: LinearGradient(
          colors: [
            AppColor.violet,
            AppColor.royalBlue
          ]
        )
      ),
    );
  }
}
