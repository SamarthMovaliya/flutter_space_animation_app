import 'dart:math';

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> planet =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.grey),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 200, end: 1),
                  duration: const Duration(seconds: 2),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(-value, 0),
                      child: Text(
                        planet["details"],
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          height: 1.5,
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: planet["tag"],
                  child: Transform.scale(
                    scale: 1.3,
                    child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 400, end: 0),
                        duration: const Duration(seconds: 1),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(value, -value),
                            child: TweenAnimationBuilder(
                              tween: Tween<double>(begin: 0, end: 2 * pi),
                              duration: const Duration(seconds: 10),
                              curve: Curves.decelerate,
                              builder: (context, value, child) {
                                return Transform.rotate(
                                  angle: value,
                                  child: Image.asset(
                                    planet["image"],
                                    height: 400,
                                    width: 400,
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 600, end: 0),
                  duration: Duration(seconds: 1),
                  curve: Curves.linearToEaseOut,
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0, value),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade100),
                        child: Text(
                          "${planet["name"]}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}
