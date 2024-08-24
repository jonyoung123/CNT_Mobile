import 'package:cached_network_image/cached_network_image.dart';
import 'package:cnt_mobile/src/utils/components/widgets/app_loader.dart';
import 'package:flutter/material.dart';

class CachedNetworkWidget extends StatelessWidget {
  const CachedNetworkWidget({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error_outline_outlined,
        size: 30,
      ),
      placeholder: (context, url) => const AppLoader(),
    );
  }
}
