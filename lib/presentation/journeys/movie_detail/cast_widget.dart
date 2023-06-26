import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/data/core/api_constants.dart';
import 'package:movie_app_bloc/data/core/app_color.dart';
import 'package:movie_app_bloc/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app_bloc/presentation/themes/theme_text.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc,CastState>(
        builder: (context,state){
      if(state is CastLoaded){
        return Container(
          height: 180,
          child: ListView.builder(
            shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.casts.length,
                itemBuilder: (context,index){
                  final castEntity = state.casts[index];
                  return Container(
                    height: 100,
                    width: 140,
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: CachedNetworkImage(
                            errorWidget: (context,url,error) => Container(
                              height: 100,
                              width: 160,
                              color: Colors.white,
                              child: Center(child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Image not found",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300),),
                                  SizedBox(height: 10,),
                                  Icon((Icons.block),color: Colors.red,)
                                ],
                              ),),
                            ),
                            height: 100,
                            width: 160,
                            imageUrl: '${ApiConstants.baseImageUrl}${castEntity.profilePath}',fit: BoxFit.fitWidth,)
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              castEntity.name!,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.vulcanBodyText2,
                            ),

                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              bottom: 2
                            ),
                            child: Text(
                              castEntity.character!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(color: AppColor.violet.withOpacity(0.6)),
                            ),

                          ),
                        ],
                      ),
                    ),

                  );
                }

          ),
        );
      }
      else {
        return SizedBox.shrink();
      }
    });
  }
}
