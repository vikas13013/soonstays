import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants/app_assets.dart';

Widget CommonChacheImage({
  double?imgHeight,
  double?imgWidht,
  required String Url,
  double?borderRadius,
  String?showImage,
  BoxFit?fit
}){
  return CachedNetworkImage(
    imageBuilder: (context, imageProvider) => Container(
      height:  imgHeight,
      width:  imgWidht,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              borderRadius??10
          ),
          image: DecorationImage(
              image: imageProvider,
              fit: fit??BoxFit.cover
          )
      ),
    ),
    imageUrl: Url,
    errorWidget: (context, url, error) => Container(
      height:  imgHeight,
      width:  imgWidht,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            borderRadius??10
        ),
        image: DecorationImage(
          image: AssetImage("${showImage??"${AppAssets.pictureImg}"}"),
          fit: fit??BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) => Container(
      height:  imgHeight,
      width:  imgWidht,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            borderRadius??10
        ),
        image: DecorationImage(
          image: AssetImage("${AppAssets.loadingImg}"),
          fit: fit??BoxFit.cover,
        ),
      ),
    ),
  );
}
