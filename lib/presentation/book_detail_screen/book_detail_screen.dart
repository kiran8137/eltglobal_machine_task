import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '& 800',
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.primary),
              child: Center(
                child: Text(
                  'Add Rating',
                  style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Color.fromARGB(255, 251, 225, 225),
            child: Center(
              child: SizedBox(
                height: 260,
                width: 170,
                child: Image.asset(
                  "assets/Book Image.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rich Dad Poor Dad',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Container(
                            height: 30,
                            width: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    width: 1.5,
                                    color: Color.fromARGB(255, 240, 240, 240))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 18,
                                ),
                                Text(
                                  '4.5',
                                  style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF5C5C5C)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}