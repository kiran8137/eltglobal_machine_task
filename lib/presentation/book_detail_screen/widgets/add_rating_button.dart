import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRatingButton extends StatelessWidget {
  const AddRatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
