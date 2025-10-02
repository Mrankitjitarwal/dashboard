import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../theme.dart';

class CalendarCard extends StatefulWidget {
  const CalendarCard({super.key});
  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  DateTime _focused = DateTime.now();
  DateTime? _selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(color: AppColors.darkCard),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'GENERAL 10:00 AM TO 7:00 PM',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.white,
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 1, 1),
                lastDay: DateTime.utc(2040, 12, 31),
                focusedDay: _focused,
                selectedDayPredicate: (d) => isSameDay(d, _selected),
                onDaySelected: (s, f) => setState(() {
                  _selected = s;
                  _focused = f;
                }),
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                calendarStyle: const CalendarStyle(outsideDaysVisible: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}