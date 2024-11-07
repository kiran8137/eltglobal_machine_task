



import 'package:flutter/material.dart';

Padding textFormField({required String labelText , required String hintText}) {
    return Padding(
      
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(labelText),
                SizedBox(height: 5),
                TextFormField(
                  
                  decoration: InputDecoration(
                     
                     hintText: hintText,
                     hintStyle: TextStyle(fontWeight: FontWeight.w400),
                     enabledBorder: OutlineInputBorder(
                       borderSide: const BorderSide(color: Color.fromARGB(102, 158, 158, 158), width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                     ),
                     focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.orange, width: 3.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                  ),
                ),
              ],
            ),
          );
  }
 