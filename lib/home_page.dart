import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List carouselItems = const [
    {'image': 'images/pic1.jpg', 'name': 'Image 1'},
    {'image': 'images/pic2.jpg', 'name': 'Image 2'},
    {'image': 'images/pic3.jpg', 'name': 'Image 3'},
    {'image': 'images/pic4.jpg', 'name': 'Image 4'},
    {'image': 'images/pic5.jpg', 'name': 'Image 5'},
  ];

  var carouselSlidercontroller = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showing carousel slider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CarouselSlider(
            items: carouselItems.map(
              (e) {
                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      e['image']!,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Text(
                          e['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, carouselPageChangedReason) {
                currentIndex = index;
                setState(() {});
              },
            ),
            carouselController: carouselSlidercontroller,
          ),
          DotsIndicator(
            dotsCount: carouselItems.length,
            position: currentIndex,
            decorator: const DotsDecorator(activeColor: Colors.blue),
            onTap: (index) {
              carouselSlidercontroller.animateToPage(index);
              currentIndex = index;
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
