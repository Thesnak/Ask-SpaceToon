import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';

class ScreenDetails extends StatelessWidget {
  String screen;
  final List<String> names = <String>[
    'Topic 1',
    'Topic 2 ',
    'Topic 3',
    'Topic 4',
    'Topic 5'
  ];

  ScreenDetails({
    required this.screen
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body:
      Container(
      decoration: const BoxDecoration(
      image: DecorationImage(
      alignment: Alignment(-.2, 0),
      image: NetworkImage(
      'https://www.whatspaper.com/wp-content/uploads/2021/05/hd-nasa-wallpaper-whatspaper-2.jpg'),
      fit: BoxFit.cover),
      ),
    child:Column(
        children:[
          Expanded(
            child:
            SizedBox(
              height: 100,
              child: ListView(
                children: [
                  SizedBox(
                    height: 100,
                    //width: ,
                  ),
                  FlutterImageStack(
                    imageList: [
                      'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
                      'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
                      'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
                      'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'

                    ],

                    //showTotalCount: true,
                    totalCount: 0,
                    itemRadius: 1000, // Radius of each images
                    // itemCount: 3, // Maximum number of images to be shown in stack
                    itemBorderWidth: 20, // Border width around the images

                  ),
                  SingleChildScrollView(
                    child: ListView(
                      children: [
                        Card(
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only()),
                              title: ReadMoreText(
                                "Go farther. Explore the Moons of Mars › Mars has no rings. However, in 50 million years when Phobos crashes into Mars or breaks apart, it could create a dusty ring around the Red Planet. When the solar system settled into its current layout about 4.5 billion years ago, Mars formed when gravity pulled swirling gas and dust in to become the fourth planet from the Sun. Mars is about half the size of Earth, and like its fellow terrestrial planets, it has a central core, a rocky mantle, and a solid crust. Mars has a dense core at its center between 930 and 1,300 miles (1,500 to 2,100 kilometers) in radius. It's made of iron, nickel, and sulfur. Surrounding the core is a rocky mantle between 770 and 1,170 miles (1,240 to 1,880 kilometers) thick, and above that, a crust made of iron, magnesium, aluminum, calcium, and potassium. This crust is between 6 and 30 miles (10 to 50 kilometers) deep. The Red Planet is actually many colors. At the surface, we see colors such as brown, gold, and tan. The reason Mars looks reddish is due to oxidization – or rusting – of iron in the rocks, regolith (Martian “soil”), and dust of Mars. This dust gets kicked up into the atmosphere and from a distance makes the planet appear mostly red." ,
                                trimLines: 3,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show More',
                                trimExpandedText: 'Show Less',
                                moreStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                lessStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        Card(
                          child: ListTile(

                            title:ReadMoreText(
                              "Mars is no place for the faint-hearted. It’s dry, rocky, and bitter cold. The fourth planet from the Sun, Mars is one of Earth's two closest planetary neighbors (Venus is the other). Mars is one of the easiest planets to spot in the night sky – it looks like a bright red point of light.",
                              trimLines: 3,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show More',
                              trimExpandedText: 'Show Less',
                              moreStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              lessStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ),
                        Card(
                            child: ListTile(
                              title: ReadMoreText(
                                "Mars was named by the ancient Romans for their god of war because its reddish color was reminiscent of blood. Other civilizations also named the planet for this attribute – for example, the Egyptians called it Her Desher meaning the red one.Even today it is frequently called the Red Planet because iron minerals in the Martian dirt oxidize or rust causing the surface to look red. Scientists don't expect to find living things currently thriving on Mars. Instead they're looking for signs of life that existed long ago when Mars was warmer and covered with water.   With a radius of 2106 miles 3.390 kilometers Mars is about half the size of Earth. If Earth were the size of a nickel Mars would be about as big as a raspberry.",
                                trimLines: 3,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show More',
                                trimExpandedText: 'Show Less',
                                moreStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                lessStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ),
                      ],
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),);
  }

}

