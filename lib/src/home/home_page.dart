import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageController = PageController(initialPage: 0, viewportFraction: .7);
  ValueNotifier<double> offsetPage = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      offsetPage.value = pageController.page ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Container(
            height: 300,
            alignment: Alignment.center,
            child: SizedBox(
              height: 150,
              child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ValueListenableBuilder<double>(
                    valueListenable: offsetPage,
                    builder: (context, value, child) {
                      double align = (value - index).abs();

                      return Container(
                        color: Colors.red,
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: align * 20, top: 40 - (20 * align)),
                        height: 150,
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        notchMargin: 16,
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: const Color(0xff3b3e9a).withOpacity(.5),
            height: 60,
          ),
        ),
      ),
    );
  }
}

class BottomBarClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
