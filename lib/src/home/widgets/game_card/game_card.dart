import 'dart:ui';

import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  const GameCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(.1),
              borderRadius: BorderRadius.circular(16),
            ),
            width: 500,
            height: 500,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: const SizedBox(
                  // color: Colors.red.withOpacity(.1),
                  width: 500,
                  height: 500,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // color: Colors.green,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: 166 / 118,
                        child: Image.network(
                          'https://images.ctfassets.net/5lpapfxq15sk/PaRS4o7f49PTGaDyQUY2u/ba99f3b16257b94d48a3c12b465d8b37/LA-KA2-mob-768.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Cyberpunk 2077',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_outlined,
                            color: Colors.amber,
                          ),
                          const Text(
                            '4.8',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const Spacer(),
                          Material(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                child: Text('Install'),
                              ),
                            ),
                          )
                        ],
                      )
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
