import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailsView extends StatelessWidget {
  final String image;
  final String tag;

  const DetailsView({Key key, this.image, this.tag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: PhotoView(
            customSize: MediaQuery.of(context).size,
            minScale: .1,
            imageProvider: NetworkImage(image),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
