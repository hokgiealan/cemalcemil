import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mppl_prak/widgets/singleitems.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  List<List<String>> menu = [
    [
      'keripikpedas',
      'Keripik Pedas',
      'Pedas',
      'Rp. 10.000',
      '4.8',
      '115',
      'Kripik khas Madura rasa pedas dengan kemasan 85gram. Sangat cocok untuk Cemal Cemil. Tersedia juga rasa original'
    ],
    [
      'keripikoriginal',
      'Keripik Original',
      'Original',
      'Rp. 10.000',
      '4.8',
      '115',
      'Kripik khas Madura rasa pedas dengan kemasan 85gram. Sangat cocok untuk Cemal Cemil. Tersedia juga rasa original'
    ],
    [
      'keripikpedasmanis',
      'Keripik Pedas Manis',
      'Pedas Manis',
      'Rp. 10.000',
      '4.8',
      '115',
      'Kripik khas Madura rasa pedas dengan kemasan 85gram. Sangat cocok untuk Cemal Cemil. Tersedia juga rasa original'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: (160 / 195),
      children: [
        for (int i = 0; i < menu.length; i++)
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 8,
                )
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleItem(menu: menu[i]),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      "images/${menu[i][0]}.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          menu[i][1],
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            menu[i][2],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            menu[i][3],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
