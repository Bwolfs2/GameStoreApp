import 'package:flutter/material.dart';

import '../game_card/game_card.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  var pageController = PageController(initialPage: 0, viewportFraction: .6);
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
    return Container(
      height: 300,
      alignment: Alignment.center,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        itemCount: 10,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return ValueListenableBuilder<double>(
            valueListenable: offsetPage,
            builder: (context, value, child) {
              double align = (value - index).abs();

              return Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Transform.translate(
                  offset: Offset(0, -align * 30),
                  child: child,
                  //Container(
                  //  color: Colors.red,
                  //  margin: const EdgeInsets.all(12),
                  //  // margin: EdgeInsets.only(left: 16, right: 16, bottom: align * 20, top: 20 * align),
                  //  height: 150,
                  //),
                ),
              );
            },
            child: const GameCard(),
          );
        },
      ),
    );
  }
}
