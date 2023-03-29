import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(const HeaderStyle());

class HeaderStyle extends StatefulWidget {
  const HeaderStyle({super.key});

  @override
  State<StatefulWidget> createState() => CalendarExample();
}

class CalendarExample extends State<HeaderStyle> {
  DateRangePickerHeaderStyle _headerStyle = const DateRangePickerHeaderStyle();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Card(
            margin: const EdgeInsets.fromLTRB(50, 150, 50, 150),
            child: SfDateRangePicker(
              headerStyle: _headerStyle,
              onViewChanged: viewChanged,
            ),
          ),
        ),
      ),
    );
  }

  void viewChanged(DateRangePickerViewChangedArgs viewChangedDetails) {
    final DateTime startDate = viewChangedDetails.visibleDateRange.startDate!;
    final DateTime endDate = viewChangedDetails.visibleDateRange.endDate!;
    final int count = endDate.difference(startDate).inDays;
    final DateTime midDate = startDate.add(Duration(days: count ~/ 2));
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {
        if (midDate.month % 2 == 0) {
          _headerStyle = const DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              backgroundColor: Colors.lightGreen,
              textStyle: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 5,
                  color: Colors.red,
                  fontWeight: FontWeight.w500));
        } else {
          _headerStyle = const DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              backgroundColor: Colors.purple,
              textStyle: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 5,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500));
        }
      });
    });
  }
}