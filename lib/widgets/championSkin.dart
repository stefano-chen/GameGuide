import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChampionSkin extends StatelessWidget {
  final String url;
  ChampionSkin(this.url);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => SpinKitCircle(
        color: Colors.black,
      ),
    );
  }
}
