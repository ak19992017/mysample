import 'package:flutter/material.dart';

class MyCalender extends StatefulWidget {
  const MyCalender({Key? key}) : super(key: key);

  @override
  State<MyCalender> createState() => _MyCalenderState();
}

class _MyCalenderState extends State<MyCalender> {
  DateTime date = DateTime.now();

  TimeOfDay time = TimeOfDay.now();

  DateTime dateTime = DateTime(2022, 2, 12, 12, 30);

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2022, 11, 5),
    end: DateTime(2022, 12, 24),
  );

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '${date.day}/${date.month}/${date.year}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    ElevatedButton(
                      child: const Text('Show Date Picker'),
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );

                        if (newDate == null) return;
                        setState(() => date = newDate);
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '$hours:$minutes',
                      style: const TextStyle(fontSize: 40),
                    ),
                    ElevatedButton(
                      child: const Text('Show Time Picker'),
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: time,
                        );
                        if (newTime == null) return;
                        setState(() => time = newTime);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text('Show date & time together'),
                    ElevatedButton(
                      child: Text(
                          '${dateTime.day}/${dateTime.month}/${dateTime.year}'),
                      onPressed: () async {
                        DateTime? d = await pickDate(context);
                        if (d == null) return;
                        setState(
                          () => dateTime = DateTime(d.year, d.month, d.day,
                              dateTime.hour, dateTime.minute),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('${dateTime.hour}:${dateTime.minute}'),
                      onPressed: () async {
                        TimeOfDay? t = await pickTime(context);
                        if (t == null) return;
                        setState(
                          () => dateTime = DateTime(dateTime.year,
                              dateTime.month, dateTime.day, t.hour, t.minute),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: Text(
                          '${dateTime.day}/${dateTime.month}/${dateTime.year}  ${dateTime.hour}:${dateTime.minute}'),
                      onPressed: () {
                        pickDateTime(context);
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text('Show Date Range Picker'),
                    ElevatedButton(
                      child: Text(
                          '${dateRange.start.day} / ${dateRange.start.month} / ${dateRange.start.year}'),
                      onPressed: () => pickDateRange(context),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: Text(
                          '${dateRange.end.day} / ${dateRange.end.month} / ${dateRange.end.year}'),
                      onPressed: () => pickDateRange(context),
                    ),
                    const SizedBox(height: 10),
                    Text('Difference : ${dateRange.duration.inDays}'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future pickDateRange(BuildContext context) async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
  }

  Future<TimeOfDay?> pickTime(context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
    );
  }

  Future<DateTime?> pickDate(context) {
    return showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
  }

  Future pickDateTime(context) async {
    DateTime? date = await pickDate(context);
    if (date == null) return;

    TimeOfDay? time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTime =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }
}
