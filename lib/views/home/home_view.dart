import 'package:NASAAstronomyPictureoftheDay/core/models/apod.dart';
import 'package:NASAAstronomyPictureoftheDay/themes/utils/utils.dart';
import 'package:NASAAstronomyPictureoftheDay/widgets/ApodCard/apod_card_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<Apod> futureApod;
  IconData _favIcon;
  bool isLiked;

//getApodImage(futureApod),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              newMethod(),
              newMethod(),
            ],
          ),
        ),
      ),
    );
  }

  Container newMethod() {
    return Container(
      margin: EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              child: Placeholder(),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.black.withAlpha(0), Colors.black12, Colors.black45],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Title",
                    style: headline3,
                  ),
                  Text(
                    "Each box represents datasets with a specific combination of source, category, and keyword. Boxes are scaled by number of datasets. Only keyword is written on the box.",
                    style: bodyText4,
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
                          size: iconSize2,
                          semanticLabel: 'translate to text',
                        ),
                      ),
                      Spacer(),
                      Text('Coprigyht'),
                      Spacer(),
                      Text('Media Type'),
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
                          color: Colors.pink[800],
                          size: iconSize2,
                          semanticLabel: 'add to favorite',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.file_download,
                          color: Colors.green,
                          size: iconSize2,
                          semanticLabel: 'download to device',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.blue,
                          size: iconSize2,
                          semanticLabel: 'share',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
FutureBuilder(
        future: fetchApod(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ApodList(
                  apods: snapshot.data,
                )
              : Center(child: CircularProgressIndicator());
        },
      ) */
class ApodList extends StatelessWidget {
  final List<Apod> apods;

  ApodList({
    Key key,
    this.apods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      reverse: true,
      itemCount: apods.length,
      itemBuilder: (context, index) => ApodCard(
        copyright: Text(apods[index].copyright == null ? 'no copyright' : apods[index].copyright),
        date: Text(apods[index].date == null ? 'no date' : apods[index].date),
        explanation: Text(apods[index].explanation == null ? 'no explanation' : apods[index].explanation),
        title: Text(apods[index].title == null ? 'no title' : apods[index].title),
        detailImage: apods[index].hdurl == null ? 'https://via.placeholder.com/600/92c952' : apods[index].hdurl,
        thumbsImage: Image.network(apods[index].mediaType == 'image' ? apods[index].hdurl : apods[index].thumbnailUrl),
        mediaType: apods[index].mediaType,
        videoUrl: apods[index].mediaType == 'video' ? apods[index].url : null,
      ),
    );
  }

  SizedBox newMethod() {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            width: 250,
            height: 250,
            child: Image.network('https://via.placeholder.com/600/92c952'),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black.withAlpha(0), Colors.black12, Colors.black45],
              ),
            ),
            child: Text(
              "Foreground Text",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
