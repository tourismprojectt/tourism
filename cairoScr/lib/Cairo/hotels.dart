import 'package:flutter/material.dart';
import '../Specification.dart';
import 'info.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class SliderP extends StatefulWidget {
  SliderP({Key? key}) : super(key: key);

  @override
  State<SliderP> createState() => _sliderPState();
}

class _sliderPState extends State <SliderP> {
  int activeindex = 0;
   final urlImages = [
    'https://images.unsplash.com/photo-1612825173281-9a193378527e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=499&q=80',
    'https://images.unsplash.com/photo-1580654712603-eb43273aff33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1627916607164-7b20241db935?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
    'https://images.unsplash.com/photo-1522037576655-7a93ce0f4d10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1570829053985-56e661df1ca2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ];
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromARGB(255, 40, 40, 35),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = urlImages[index];
              return buildImage(urlImage, index);
            },
            options: CarouselOptions(
              height: 400,
              onPageChanged: (index, reason) =>
                  setState(() => activeindex = index),
            ),
          ),
          SizedBox(height: 12),
          buildIndicator(),
        ],
      ),
    ),
  );
}

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: ExpandingDotsEffect(
          dotWidth: 15,
          activeDotColor: Colors.blue,
        ),
        activeIndex: 0,
        count: urlImages.length,
      );
}
class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cairo'),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstRoute()),
            ); // Implement the back button functionality
          },
        ),
      ),
      body: Column(
        children: [
          Specify(),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Welcome to Hotels!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 200, // Adjust the height of the image row
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildImageCard('images/ramsesimages/ramses hilton.jpg'),
                _buildImageCard('images/ramsesimages/rest.jpg'),
                _buildImageCard('images/ramsesimages/room.jpg'),
                _buildImageCard('images/ramsesimages/swimming-pool-day.avif'),
                // Add more image paths here
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 150, // Adjust the width of each image
          ),
        ),
      ),
    );
  }
}
Widget buildImage(String urlImage, int index) =>
    Container(child: Image.network(urlImage, fit: BoxFit.cover));