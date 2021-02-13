import 'package:NASAAstronomyPictureoftheDay/core/models/apod.dart';
import 'package:NASAAstronomyPictureoftheDay/themes/utils/font.dart';
import 'package:NASAAstronomyPictureoftheDay/widgets/ApodCard/apod_card_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<Apod> futureApod;

//getApodImage(futureApod),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: SizedBox(
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
                        style: headline2,
                      ),
                      Text(
                        "Each box represents datasets with a specific combination of source, category, and keyword. Boxes are scaled by number of datasets. Only keyword is written on the box.",
                        style: bodyText1,
                      ),
                      Row()
                    ],
                  ),
                ),
              ],
            ),
          ),
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
