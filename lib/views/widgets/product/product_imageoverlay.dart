import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
class ImageOverlay extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;

  ImageOverlay({
    required this.imageUrls,
    required this.initialIndex,
  });

  @override
  _ImageOverlayState createState() => _ImageOverlayState();
}

class _ImageOverlayState extends State<ImageOverlay> {
  late int _currentIndex;
  bool _isFirstImage = false;
  bool _isLastImage = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _checkFirstAndLastImage();
  }

  void _checkFirstAndLastImage() {
    setState(() {
      _isFirstImage = _currentIndex == 0;
      _isLastImage = _currentIndex == widget.imageUrls.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: Colors.transparent, 
          body: Stack(
            children: [
              Center(
                child: PhotoView(
                  imageProvider: NetworkImage(widget.imageUrls[_currentIndex]),
                  maxScale: PhotoViewComputedScale.contained * 2.0,
                ),
              ),
              Positioned(
          top: 40,
          right: 20,
          child: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        if (!_isFirstImage)
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                setState(() {
                  _currentIndex--;
                  _checkFirstAndLastImage();
                });
              },
            ),
          ),
        if (!_isLastImage)
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            right: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                setState(() {
                  _currentIndex++;
                  _checkFirstAndLastImage();
                });
              },
            ),
          ),
            ],
          ),
        
        );

  }
}
