import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/data/core/api_constants.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

class MovieBackDropWidget extends StatelessWidget {
  const MovieBackDropWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return FractionallySizedBox(
     alignment: Alignment.topCenter,
     heightFactor: 0.7,
     child: ClipRRect(
       borderRadius: const BorderRadius.vertical(
         bottom: Radius.circular(40)
       ),
       child: Stack(
         children: [
           FractionallySizedBox(
             heightFactor: 1,
             widthFactor: 1,
             child: BlocBuilder<MovieBackdropBloc,MovieBackdropState>(
                 builder: (context,state){
                  if(state is MovieBackdropChanged){
                    return CachedNetworkImage(
                        imageUrl: '${ApiConstants.baseImageUrl}${state.movie.backdropPath}',
                      fit: BoxFit.fitHeight,
                    );
                  }
                  return const SizedBox.shrink();
             }),
           ),
           BackdropFilter(filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
           child: Container(
             width: MediaQuery.of(context).size.width,
             height: 1,
             color: Colors.transparent,
           ),)
         ],
       ),
     ),
   );
  }
}
