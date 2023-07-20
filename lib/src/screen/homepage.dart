import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imageList = [
    {"id": 1, "image_path": "assets/slider/slide1.JPG"},
    {"id": 2, "image_path": "assets/slider/slide2.JPG"},
    {"id": 3, "image_path": "assets/slider/slide3.JPG"},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  List<String> gridList=['សួរខ្ញុំមក','រចនារូបភាព','សំលេងទៅជាអត្ថបទ','បណ្ណាល័យ','អត្ថបទទៅជាសំលេង','សន្ទនា/ជជែក'];
  List<String> grid1List=['AI-Ask','AI-Art','AI-Text','AI-Book','AI-Speech','AI-Talk'];
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    final double itemHeight=(size.height-kTextTabBarHeight-2)/7.2;
    final double itemWidth=size.width/2;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 300,
        backgroundColor: Color.fromARGB(255, 20, 153, 153),
        leading: const Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage('assets/Logo.png'),
                color: Colors.white,
                width: 100.0,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              print(currentIndex);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: grid(),
          // ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth/itemHeight),
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: gridList.map((String value) {

                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.amberAccent,),
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  
                );
              },
              ).toList()
              ),
          )
        ],
      ),
    );
  }
}
