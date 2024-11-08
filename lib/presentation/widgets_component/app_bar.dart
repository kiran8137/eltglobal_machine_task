
import 'package:flutter/material.dart';

AppBar commonAppBar(BuildContext context , [String? title]) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text( title ?? '',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: MediaQuery.of(context).size.width < 600 ? 20 : 24
      ),
      ),
    );
  }