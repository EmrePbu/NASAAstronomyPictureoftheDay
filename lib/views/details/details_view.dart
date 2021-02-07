import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';

class DetailsView extends StatelessWidget {
  final String mediaType;
  final String image;
  final String videoUrl;
  final String tag;

  const DetailsView({
    Key key,
    this.image,
    this.tag,
    this.mediaType,
    this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller;
    if (videoUrl != null) {
      _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
        ),
      );
    }

    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: mediaType == 'image'
              ? PhotoView(
                  customSize: MediaQuery.of(context).size,
                  minScale: .1,
                  imageProvider: NetworkImage(image),
                )
              : YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
// Html(
//     data: '<iframe width="560" height="315" src="https://www.youtube.com/embed/D_mCZlQZg9Y" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
// )
