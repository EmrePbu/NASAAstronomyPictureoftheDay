import 'package:NASAAstronomyPictureoftheDay/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

class LoadingView extends StatefulWidget {
  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard _riveArtboard;
  RiveAnimationController _controller;
  @override
  void initState() {
    super.initState();
    riveLoading();
  }

  void riveLoading() {
    rootBundle.load('assets/rive/space_load.riv').then(
      (data) async {
        final file = RiveFile();

        if (file.import(data)) {
          final artboard = file.mainArtboard;

          artboard.addController(_controller = SimpleAnimation('Pull'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: _controller?.isActive == true ? _loadingSplash() : _loadingSplash(),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white54,
                  ),
                  Text(
                    'Next',
                    style: TextStyle(fontSize: 20.0, color: Colors.white54),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => HomeView(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _loadingSplash() {
    return _riveArtboard == null
        ? const SizedBox()
        : Rive(
            artboard: _riveArtboard,
            fit: BoxFit.cover,
          );
  }
}
// TODO: Bu kısımda günün fotoğrafını yükle ki uygulama içerisinde bekleme olmasın
