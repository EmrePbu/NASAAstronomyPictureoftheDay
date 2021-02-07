import 'package:NASAAstronomyPictureoftheDay/core/models/apod.dart';
import 'package:NASAAstronomyPictureoftheDay/core/services/get_apod_list.dart';
import 'package:NASAAstronomyPictureoftheDay/widgets/ApodCard/apod_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      appBar: AppBar(
        title: Text('NASA - Apod'),
      ),
      body: FutureBuilder(
        future: fetchApod(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ApodList(
                  apods: snapshot.data,
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ApodList extends StatelessWidget {
  final List<Apod> apods;

  ApodList({Key key, this.apods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: apods.length,
      itemBuilder: (context, index) {
        // TODO: bu kısımda mediatype ları kontrol ederek kontrol deyimleri oluştur.
        return ApodCard(
          copyright: Text(apods[index].copyright == null ? 'no copyright' : apods[index].copyright),
          date: Text(apods[index].date == null ? 'no date' : apods[index].date),
          explanation: Text(apods[index].explanation == null ? 'no explanation' : apods[index].explanation),
          title: Text(apods[index].title == null ? 'no title' : apods[index].title),
          detailImage: apods[index].hdurl == null ? 'https://via.placeholder.com/600/92c952' : apods[index].hdurl,
          thumbsImage: Image.network(apods[index].mediaType == 'image' ? apods[index].hdurl : apods[index].thumbnailUrl),
          mediaType: apods[index].mediaType,
          videoUrl: apods[index].mediaType == 'video' ? apods[index].url : null,
        );
      },
    );
  }
}
