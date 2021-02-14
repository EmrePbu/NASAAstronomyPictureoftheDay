import 'package:NASAAstronomyPictureoftheDay/core/models/apod.dart';
import 'package:NASAAstronomyPictureoftheDay/widgets/ApodCard/apod_card_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<Apod> futureApod;

  int _selectedItemPosition = 0;

  Color containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
    const Color(0xFFF4E4CE),
    const Color(0xFFF4E4CE),
    const Color(0xFFF4E4CE),
  ];

//getApodImage(futureApod),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF48388D),
      body: SafeArea(
        child: AnimatedContainer(
          color: containerColor ?? containerColors[0],
          duration: Duration(seconds: 1),
          child: PageView(
            onPageChanged: _onPageChanged,
            children: [],
          ),
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        height: 30,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        padding: EdgeInsets.all(12),
        snakeViewColor: Color(0xFF48388D),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icons8_sphere.svg', color: Colors.white)),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icons8_sphere.svg', color: Colors.white)),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icons8_sphere.svg', color: Colors.white)),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icons8_sphere.svg', color: Colors.white)),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icons8_sphere.svg', color: Colors.white)),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icons8_sphere.svg', color: Colors.white)),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icons8_sphere.svg', color: Colors.white)),
        ],
      ),
    );
  }

  void _onPageChanged(int page) {
    containerColor = containerColors[page];
    switch (page) {
      case 0:
        setState(() {
          _selectedItemPosition = 0;
        });
        break;
      case 1:
        setState(() {
          _selectedItemPosition = 1;
        });
        break;

      case 2:
        setState(() {
          _selectedItemPosition = 2;
        });
        break;
      case 3:
        setState(() {
          _selectedItemPosition = 3;
        });
        break;
      case 4:
        setState(() {
          _selectedItemPosition = 4;
        });
        break;
      case 5:
        setState(() {
          _selectedItemPosition = 5;
        });
        break;
      case 6:
        setState(() {
          _selectedItemPosition = 6;
        });
        break;
    }
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
}
