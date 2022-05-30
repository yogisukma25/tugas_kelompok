import 'package:flutter/material.dart';

class Features extends StatelessWidget {
  List<_FeaturePhoto> _feature() {
    return [
      _FeaturePhoto(imageURL: 'https://res.cloudinary.com/di5fbic64/image/upload/v1653897561/gambarku/aja_vuv9eq.png', title: '', subtitle: '', featureString: ''),
      _FeaturePhoto(imageURL: 'https://res.cloudinary.com/di5fbic64/image/upload/v1653897561/gambarku/aja_vuv9eq.png', title: '', subtitle: '', featureString: ''),
      _FeaturePhoto(imageURL: 'https://res.cloudinary.com/di5fbic64/image/upload/v1653897561/gambarku/aja_vuv9eq.png', title: '', subtitle: '', featureString: ''),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260,
        width: 220,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10.0),
            children: _feature().map<Widget>((photo) {
              return _FeatureGridItem(featurePhoto: photo); //Feature(photo);
            }).toList()));
  }
}

class _FeaturePhoto {
  _FeaturePhoto({this.imageURL, this.title, this.subtitle, this.featureString});
  final String imageURL;
  final String title;
  final String subtitle;
  final String featureString;
}

class _FeatureText extends StatelessWidget {
  const _FeatureText(this.text, this.fontSize);
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14),
      child: Text(text, style: TextStyle(fontFamily: 'ConcertOne-Regular', fontSize: fontSize)),
    );
  }
}

class _FeatureGridItem extends StatelessWidget {
  _FeatureGridItem({Key key, @required this.featurePhoto}) : super(key: key);

  final _FeaturePhoto featurePhoto;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: <Widget>[
            Image.network(featurePhoto.imageURL, width: 340, height: 230, fit: BoxFit.cover),
            Positioned(
                top: 0,
                left: 140,
                child: Container(
                  height: 25,
                  width: 80,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.0), color: Colors.transparent, //Color(0xff0F0F0F),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                        )
                      ]),
                  child: Center(
                    child: Text(
                      featurePhoto.featureString,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 5,
        margin: EdgeInsets.all(3),
      ),
      _FeatureText(featurePhoto.title, 0),
      _FeatureText(featurePhoto.subtitle, 0),
    ]);
  }
}
