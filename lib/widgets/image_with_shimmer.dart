import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageWithShimmer extends StatelessWidget {
  final String imageUrl;
  const ImageWithShimmer({Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
          period : const Duration(milliseconds: 800),
          child: Container(
            color: Colors.white,
          ),
          baseColor: Colors.grey,
          highlightColor: Colors.white.withOpacity(0.2)
      ),
    );
  }
}
