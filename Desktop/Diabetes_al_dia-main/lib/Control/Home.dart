import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime _currentDate;
  late List<DateTime> _weekDates;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _weekDates = _getWeekDates(_currentDate);
  }

  List<DateTime> _getWeekDates(DateTime currentDate) {
    final dayOfWeek = currentDate.weekday;
    final firstDayOfWeek = currentDate.subtract(Duration(days: dayOfWeek - 1));
    final List<DateTime> weekDates = [];
    for (int i = 0; i < 7; i++) {
      weekDates.add(firstDayOfWeek.add(Duration(days: i)));
    }
    return weekDates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week Dates'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Current Date: ${_currentDate.toString()}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (DateTime date in _weekDates)
                  Text(
                    '${date.day}',
                    style: TextStyle(
                      fontSize: 20,
                      color: date.day == _currentDate.day
                          ? Colors.blue
                          : Colors.black,
                      fontWeight: date.day == _currentDate.day
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
