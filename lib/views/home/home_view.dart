import 'package:NASAAstronomyPictureoftheDay/core/models/apod.dart';
import 'package:NASAAstronomyPictureoftheDay/core/services/get_apod_list.dart';
import 'package:NASAAstronomyPictureoftheDay/widgets/ApodCard/apod_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedItemPosition = 0;
  Future<Apod> futureApod;

  void _handleIndexChanged(int i) {
    setState(() {
      //_selectedItemPosition = i;
    });
  }

//getApodImage(futureApod),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF48388D),
      body: SafeArea(
        child: AnimatedContainer(
            duration: Duration(seconds: 1),
            child: FutureBuilder(
              future: fetchApod(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.hasData) {
                  return PageView.builder(
                      reverse: true,
                      controller: PageController(initialPage: 6),
                      onPageChanged: _onPageChanged,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ApodCard(
                          copyright: Text(snapshot.data[index].copyright == null ? 'no copyright' : snapshot.data[index].copyright),
                          date: Text(snapshot.data[index].date == null ? 'no date' : snapshot.data[index].date),
                          explanation: Text(snapshot.data[index].explanation == null ? 'no explanation' : snapshot.data[index].explanation),
                          title: Text(snapshot.data[index].title == null ? 'no title' : snapshot.data[index].title),
                          detailImage: snapshot.data[index].hdurl == null ? 'https://via.placeholder.com/600/92c952' : snapshot.data[index].hdurl,
                          thumbsImage: Image.network(
                              snapshot.data[index].mediaType == 'image' ? snapshot.data[index].hdurl : snapshot.data[index].thumbnailUrl),
                          mediaType: snapshot.data[index].mediaType,
                          videoUrl: snapshot.data[index].mediaType == 'video' ? snapshot.data[index].url : null,
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedItemPosition,
        onTap: _handleIndexChanged,
        items: [
          bottomBarItem(),
          bottomBarItem(),
          bottomBarItem(),
          bottomBarItem(),
          bottomBarItem(),
          bottomBarItem(),
          bottomBarItem(),
        ],
      ),
    );
  }

  SalomonBottomBarItem bottomBarItem() {
    return SalomonBottomBarItem(
      selectedColor: Colors.purple[50],
      title: Text(''),
      icon: SvgPicture.asset('assets/icons/icons8_new_moon.svg', color: Colors.white, height: 15),
    );
  }

  void _onPageChanged(int page) {
    switch (page) {
      case 0:
        setState(() {
          _selectedItemPosition = 6;
        });
        break;
      case 1:
        setState(() {
          _selectedItemPosition = 5;
        });
        break;

      case 2:
        setState(() {
          _selectedItemPosition = 4;
        });
        break;
      case 3:
        setState(() {
          _selectedItemPosition = 3;
        });
        break;
      case 4:
        setState(() {
          _selectedItemPosition = 2;
        });
        break;
      case 5:
        setState(() {
          _selectedItemPosition = 1;
        });
        break;
      case 6:
        setState(() {
          _selectedItemPosition = 0;
        });
        break;
    }
  }
}
