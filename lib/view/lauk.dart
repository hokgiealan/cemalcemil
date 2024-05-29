import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mppl_prak/view/home.dart';
import 'package:mppl_prak/widgets/singleitemlauk.dart';


class lauk extends StatefulWidget {
  const lauk({super.key});

  @override
  State<lauk> createState() => _laukState();
}

class _laukState extends State<lauk> {
  List<List<String>> favorites = []; // List untuk menyimpan item favorit

  @override
  Widget build(BuildContext context) {
    List<List<String>> menu = [
      [
        'lauk1',
        'Serundeng',
        'Original',
        'Rp. 10.000',
        '4.8',
        '115',
        'Serundeng ini menggunakan bahas berkualitas (tanpa pengawet)'
      ]
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.circleArrowLeft,
                        color: Colors.black,
                        size: 35,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Lauk',
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: menu.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SingleItemlauk(menu: menu[index]),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: 400,
                        height: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 185,
                              height: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "images/${menu[index][0]}.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      menu[index][1],
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      menu[index][2],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      menu[index][3],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Icon(
                                          Icons.star,
                                          color: const Color.fromARGB(
                                              255, 236, 149, 18),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 5, top: 5),
                                        child: Text(
                                          menu[index][4],
                                          style: GoogleFonts.nunitoSans(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 5, top: 3),
                                        child: Text(
                                          menu[index][5],
                                          style: GoogleFonts.nunitoSans(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 2, top: 3),
                                        child: Text(
                                          'sold',
                                          style: GoogleFonts.nunitoSans(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 30),
                                      GestureDetector(
                                        onTap: () {
                                          if (!favorites
                                              .contains(menu[index])) {
                                            setState(() {
                                              favorites.add(menu[
                                                  index]); // Menambahkan item yang dipilih ke dalam list favorit jika belum ada
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}