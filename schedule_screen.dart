import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today - 16 Oct'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _ScheduleCard(
              time: '8:00 - 9:00',
              title: 'DSA - Arrays (Notes)',
              color: Colors.blue.shade50,
              borderColor: Colors.blue.shade200,
            ),
            _ScheduleCard(
              time: '9:15 - 10:00',
              title: 'Web Tech (Video)',
              color: Colors.green.shade50,
              borderColor: Colors.green.shade200,
            ),
            _ScheduleCard(
              time: '10:30 - 11:30',
              title: 'DBMS (Quiz)',
              color: Colors.lightBlueAccent.shade200,
              borderColor: Colors.lightBlue,
            ),
            _ScheduleCard(
              time: '2:00 - 3:00',
              title: 'Java Assignment',
              color: Colors.amber.shade50,
              borderColor: Colors.amber.shade200,
            ),
            _ScheduleCard(
              time: '4:00 - 5:00',
              title: 'English (Practice)',
              color: Colors.red.shade50,
              borderColor: Colors.red.shade200,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.calendar_month, color: Colors.blue),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Plan adjusted to your available hours.',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  final String time;
  final String title;
  final Color color;
  final Color borderColor;

  const _ScheduleCard({
    required this.time,
    required this.title,
    required this.color,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(time, style: TextStyle(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
          Checkbox(
            value: false,
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}