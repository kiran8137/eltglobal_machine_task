import 'package:flutter/material.dart';

SizedBox searchTextField() {
    return SizedBox(
            height: 37,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                labelText: 'Search...',
                labelStyle: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.white, width: 0.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          );
  }