import 'package:flutter/cupertino.dart';
import 'package:wiredash/wiredash.dart';

class WireDashApp extends StatelessWidget {
  const WireDashApp({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movie-app-pb5y1jg', secret: 'vomujRyNa80RPWGUsgjOTiS-GeDc_Hcr', child: child,);
  }
}
