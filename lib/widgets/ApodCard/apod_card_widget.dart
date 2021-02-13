import 'package:NASAAstronomyPictureoftheDay/views/details/details_view.dart';
import 'package:flutter/material.dart';

class ApodCard extends StatefulWidget {
  const ApodCard({
    Key key,
    this.copyright,
    this.thumbsImage,
    this.detailImage,
    this.title,
    this.date,
    this.explanation,
    this.videoUrl,
    this.mediaType,
  }) : super(key: key);

  final Widget copyright;
  final Widget thumbsImage;
  final String detailImage;
  final Widget title;
  final Widget date;
  final Widget explanation;
  final String videoUrl;
  final String mediaType;

  @override
  _ApodCardState createState() => _ApodCardState();
}

class _ApodCardState extends State<ApodCard> {
  IconData _favIcon;
  bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Card(
        elevation: 10.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: widget.thumbsImage,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return DetailsView(
                        image: widget.detailImage,
                        videoUrl: widget.videoUrl,
                        mediaType: widget.mediaType,
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: widget.title,
              subtitle: Row(
                children: [Text('Copyright '), widget.copyright],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  // TODO: Bu kısımda telefon dilini alarak content i ingilizceden telefon diline çevirmen gerek
                  onPressed: () {},
                  icon: Icon(
                    Icons.translate,
                    color: Colors.blue,
                    size: 30.0,
                    semanticLabel: 'translate to text',
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (isLiked == true) {
                        _favIcon = Icons.favorite_border;
                        isLiked = false;
                      } else {
                        _favIcon = Icons.favorite;
                        isLiked = true;
                      }
                      print(isLiked);
                    });
                  },
                  icon: Icon(
                    _favIcon,
                    color: Colors.black,
                    size: 30.0,
                    semanticLabel: 'add to favorite',
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.file_download,
                    color: Colors.green,
                    size: 30.0,
                    semanticLabel: 'download to device',
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.blue,
                    size: 30.0,
                    semanticLabel: 'share',
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              alignment: Alignment.centerLeft,
              child: widget.date,
            ),
            Divider(
              thickness: 1.0,
              endIndent: 10.0,
              indent: 10.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
              child: widget.explanation,
            ),
          ],
        ),
      ),
    );
  }
}
