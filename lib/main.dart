import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(HeaderStyle());

class HeaderStyle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalendarExample();
}

class CalendarExample extends State<HeaderStyle> {
  DateRangePickerHeaderStyle _headerStyle;
  int _count;
  DateTime _midDate;

  @override
  initState() {
    super.initState();
  }

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
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      _count = (viewChangedDetails.visibleDateRange.endDate
          .difference(viewChangedDetails.visibleDateRange.startDate)
          .inDays);
      var _middleDate = (_count ~/ 2).toInt();
      _midDate = viewChangedDetails.visibleDateRange.startDate
          .add(Duration(days: _middleDate));
      setState(() {
        if (_midDate.month % 2 == 0) {
          _headerStyle = DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              backgroundColor: Colors.lightGreen,
              textStyle: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 5,
                  color: Colors.red,
                  fontWeight: FontWeight.w500));
        } else {
          _headerStyle = DateRangePickerHeaderStyle(
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
