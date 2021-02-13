import 'package:NASAAstronomyPictureoftheDay/views/loading/loading_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingView(),
    );
  }
}
// TODO: Bu kısımda yada loading kısmında dataları yükleme işlemini gerçekleştir. ve json olarak kaydet
