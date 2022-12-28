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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: CommonText(
                    text: 'Select time',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: GestureDetector(
                        onTap: () => selectStartTime(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              startTime.format(context).toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            const Icon(
                              Icons.access_time_outlined,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    const CommonText(
                      text: 'To',
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    const SizedBox(width: 40),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: GestureDetector(
                        onTap: () => selectEndTime(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              endTime.format(context).toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            const Icon(
                              Icons.access_time_outlined,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CommonText(
                    text:
                        "Your session will start at ${startTime.format(context).toString()} ",
                    fontSize: 18,
                    color: Colors.black),
                const SizedBox(height: 5),
                CommonText(
                    text:
                        "and will end at ${endTime.format(context).toString()}",
                    fontSize: 18,
                    color: Colors.black),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommonText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const CommonText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
