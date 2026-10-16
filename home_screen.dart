import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import 'add_task_screen.dart';
import 'schedule_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskCount = Provider.of<TaskProvider>(context).tasks.length;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Greeting & Profile Icon (Fixed to spaceBetween)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good Morning,', style: TextStyle(fontSize: 18, color: Colors.grey)),
                      Text('Jahnavi', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.account_circle, size: 40, color: Colors.blueGrey),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Motivational Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.lightbulb, color: Colors.amber, size: 28),
                    SizedBox(width: 12),
                    Text('Small steps make big progress!', style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Grid Dashboard Cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _DashboardCard(
                      title: 'My Tasks',
                      subtitle: '$taskCount today',
                      icon: Icons.description,
                      color: Colors.green.shade50,
                      borderColor: Colors.green.shade200,
                      iconColor: Colors.green,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const ScheduleScreen()));
                      },
                    ),
                    _DashboardCard(
                      title: 'Daily Plan',
                      subtitle: 'View',
                      icon: Icons.calendar_month,
                      color: Colors.purple.shade50,
                      borderColor: Colors.purple.shade200,
                      iconColor: Colors.purple,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const ScheduleScreen()));
                      },
                    ),
                    _DashboardCard(
                      title: 'Learning Resources',
                      subtitle: 'Access',
                      icon: Icons.book,
                      color: Colors.blue.shade50,
                      borderColor: Colors.blue.shade200,
                      iconColor: Colors.blue,
                      onTap: () {},
                    ),
                    _DashboardCard(
                      title: 'Progress',
                      subtitle: 'Analytics',
                      icon: Icons.bar_chart,
                      color: Colors.orange.shade50,
                      borderColor: Colors.orange.shade200,
                      iconColor: Colors.orange,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const AddTaskScreen()));
        },
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color borderColor;
  final Color iconColor;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.borderColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: iconColor),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyle(color: Colors.grey.shade700)),
          ],
        ),
      ),
    );
  }
}