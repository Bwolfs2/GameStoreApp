import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glass_app_bar/src/home/widgets/card_list/card_list.dart';
import 'package:glass_app_bar/src/home/widgets/rank_card/rank_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff120B4C),
          Color(0xff3B0A58),
        ])),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2012/11/21/17/02/lion-66898_960_720.jpg"),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Vladmir Kucher',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        'UX/UI Designer',
                        style: TextStyle(color: Colors.white.withOpacity(.5), fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.fullscreen_exit,
                      color: Colors.white,
                      size: 36,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      margin: const EdgeInsets.all(16),
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white.withOpacity(.8),
                          ),
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          color: Colors.black.withOpacity(.3)),
                      height: 60,
                      child: Text(
                        "Enter your code",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(.5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    const RankCard(),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Recommended",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const CardList(),
                    const CardList(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Material(
              elevation: 4,
              color: const Color(0xff3b3e9a).withOpacity(.2),
              child: InkWell(
                //backgroundColor: Colors.transparent,
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.catching_pokemon,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                const SizedBox(width: 80),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 36,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
