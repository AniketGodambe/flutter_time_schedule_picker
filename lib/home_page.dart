import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TimeOfDay startTime;
  late TimeOfDay endTime;
  var now = DateTime.now();

  @override
  initState() {
    var hour = DateFormat("HH").format(now);
    var minute = DateFormat("mm").format(now);

    startTime = TimeOfDay(hour: int.parse(hour), minute: int.parse(minute));
    endTime = TimeOfDay(hour: int.parse(hour) + 1, minute: int.parse(minute));

    super.initState();
  }

  Future<void> selectStartTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (pickedTime != null) {
      setState(() {
        startTime = pickedTime;
      });
    }
  }

  Future<void> selectEndTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: endTime,
    );
    if (pickedTime != null) {
      setState(() {
        endTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
