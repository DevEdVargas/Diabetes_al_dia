import 'package:flutter/material.dart';
import 'dart:core';

class WeekdaysGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<String> weekdays = ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"];
    return GridView.builder(
      itemCount: weekdays.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemBuilder: (BuildContext context, int index) {
        String weekday = weekdays[index];
        bool isToday =
            DateTime.now().weekday == index + 1; // Check if it's today
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isToday
                  ? Colors.blue
                  : Colors.transparent, // Highlight today's date
              width: 2.0,
            ),
          ),
          child: Center(
            child: Text(
              weekday,
              style: TextStyle(
                fontSize: 18.0,
                color: isToday ? Colors.blue : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
