import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zipbuzz/DataSet/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<dynamic, String>> catlog = category().Catelog;
  bool issearch = false;
  bool isapper = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: Color.fromARGB(255, 73, 67, 236),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isapper = false;
                Future.delayed(
                  Duration(milliseconds: 100),
                ).then((value) {
                  setState(() {
                    issearch = false;
                  });
                });
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: double.infinity,
              height: issearch ? 112 : 60,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                color: Color.fromARGB(255, 73, 67, 236),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/PNG/locationicon.png')),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "San Jose, USA",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Poppins"),
                            ),
                            Text(
                              "94088",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.65),
                                  fontSize: 12,
                                  fontFamily: "Poppins"),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      if (issearch == false)
                        InkWell(
                          enableFeedback: true,
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            setState(() {
                              issearch = true;
                              Future.delayed(
                                Duration(milliseconds: 500),
                              ).then((value) {
                                setState(() {
                                  isapper = true;
                                });
                              });
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(
                              milliseconds: 500,
                            ),
                            width: issearch ? 0 : 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromARGB(36, 255, 255, 255),
                            ),
                            child: Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(36, 255, 255, 255),
                        ),
                        child: Icon(
                          Icons.notifications_none_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  if (isapper)
                    SizedBox(
                      height: 12,
                    ),
                  if (isapper)
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      height: isapper ? 40 : 0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(36, 255, 255, 255),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Search for an event",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Poppins",
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (issearch == false)
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              padding: EdgeInsets.all(8),
              height: issearch ? 0 : 48,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // tileMode: TileMode.c,
                  colors: [
                    Colors.white,
                    Color.fromARGB(255, 241, 245, 249),
                  ],
                  stops: [0.955, 0.05],
                ),
              ),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemCount: catlog.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: SvgPicture.asset(catlog[index]['SmallIcon']!),
                  );
                },
              ),
            ),
          if (issearch)
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.all(8),
              height: issearch ? 218 : 0,
              width: double.infinity,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: catlog.length,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    child: SvgPicture.asset(catlog[index]['Svg']!),
                  );
                },
              ),
            ),
          if (issearch)
            AnimatedContainer(
              height: 10,
              duration: Duration(
                milliseconds: 200,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 73, 67, 236),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 217, 217, 217),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              ),
            ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Calendar Events",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 265,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 244, 247, 249),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      Container(
                        height: 48,
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "December 2023",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins"),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: SvgPicture.asset('assets/SVG/calender.svg'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
