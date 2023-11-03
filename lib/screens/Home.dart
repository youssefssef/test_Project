// ignore_for_file: use_full_hex_values_for_flutter_colors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_test/Widgets/edit_button.dart';
import 'package:project_test/database/db_helper.dart';

import 'new_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF3556AB),
        toolbarHeight: 130,
        title: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, image: DecorationImage(image: AssetImage('assets/profile2.jpg'), fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Jhon',
                        style:
                            GoogleFonts.roboto(textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white)),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 221,
                        child: Text(
                          'What are  your plans for today?',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 25,
                                  color: Colors.white,
                                  height: 1.2)),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 116,
              decoration: BoxDecoration(
                color: const Color(0XFFF9EB031),
                border: Border.all(color: Colors.grey, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1), // Color with 10% opacity (#000000 with 10% opacity)
                    offset: Offset(0, 4), // X: 0, Y: 4
                    blurRadius: 4, // Blur: 4
                    spreadRadius: 0, // Spread: 0
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 30),
                    child: SizedBox(
                      height: 50,
                      child: Image.asset(
                        'assets/trophy.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Go Pro (No Ads)',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xFFFF071D55),
                            shadows: [
                              Shadow(
                                color: Color(0xffffFFFFFF), // Shadow color (#FFFFFF)
                                offset: Offset(0, 1), // X: 0, Y: 1
                                blurRadius: 0, // Blur: 0
                              ),
                            ],
                          )),
                        ),
                        SizedBox(
                          width: 190,
                          child: Text(
                            "No fuss, no ads, for only \$1 a month",
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.7,
                                    color: Color(0xFFFF0D2972),
                                    shadows: [
                                      Shadow(
                                        color: Color(0xffffFFFFFF), // Shadow color (#FFFFFF)
                                        offset: Offset(0, 1), // X: 0, Y: 1
                                        blurRadius: 0, // Blur: 0
                                      ),
                                    ],
                                    height: 1.2)),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Container(
                      height: 71,
                      width: 66.11,
                      color: const Color(0xffff071D55),
                      child: Center(
                        child: Text(
                          '\$1',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: const Color(0XFFF9EB031),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                FutureBuilder(
                  future: getNotes(), // Assuming getNotes() returns List<Map<String, dynamic>>
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Add new task',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey,
                          )),
                        ),
                      );
                    } else {
                      List<Map<String, dynamic>> tasksData = snapshot.data as List<Map<String, dynamic>>;
                      return Edit_Button(tasksData: tasksData);
                    }
                  },
                ),
                Positioned(
                  bottom: 15,
                  right: 10,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Newtask()),
                          );
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xfff3556AB),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 2, color: const Color(0xfff123EB1)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(168, 181, 222, 0.5), // Inner shadow color (#A8B5DE with 50% opacity)
                                offset: Offset(0, 3), // Inner shadow X: 0, Y: 3
                                blurRadius: 1, // Inner shadow blur: 1
                                spreadRadius: 0, // Inner shadow spread: 0
                              ),
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25), // Drop shadow color (#000000 with 25% opacity)
                                offset: Offset(0, 4), // Drop shadow X: 0, Y: 4
                                blurRadius: 4, // Drop shadow blur: 4
                                spreadRadius: 0, // Drop shadow spread: 0
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: Color(0xfffFFFFFF),
                            ),
                          ),
                        ),
                      )),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getNotes() async {
    SqlDb sqldb = SqlDb();
    List<Map<String, dynamic>> notes = await sqldb.gettask();
    return notes;
  }
}
