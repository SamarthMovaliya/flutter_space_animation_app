import 'package:flutter/material.dart';

import '../Globals/Modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.menu_rounded),
          title: const Text(
            "Planets",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          backgroundColor: Colors.grey,
          elevation: 1,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          // color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: galaxy
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: 350,
                          height: 550,
                          child: Container(
                            height: 500,
                            width: 290,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      blurStyle: BlurStyle.inner,
                                      offset: Offset(2, 3),
                                      blurRadius: 20,
                                      spreadRadius: 2,
                                      color: Colors.grey)
                                ],
                                borderRadius: BorderRadius.circular(60),
                                color: Colors.grey.shade300),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                     setState(() {
                                       Navigator.pushNamed(context, "DetailPage",
                                           arguments: e);
                                     });
                                    },
                                    child: Hero(
                                      tag: e["tag"],
                                      child: Transform.scale(
                                        scale: 1.5,
                                        child: Container(
                                            height: 200,
                                            width: 200,
                                            child: Image.asset(e["image"])),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 200,
                                  ),
                                  Transform.translate(
                                    offset: Offset(0, 100),
                                    child: Text(
                                      e["name"],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 60,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
