import 'package:flutter/material.dart';
import 'package:gp2/calendar_page.dart';
import 'package:gp2/personal_page.dart';
import 'package:gp2/statistics_page.dart';
import 'ai_assistant_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Helper method to convert weekday integer to a string
String _weekdayToString(int weekday) {
  switch (weekday) {
    case 1:
      return "Monday";
    case 2:
      return "Tuesday";
    case 3:
      return "Wednesday";
    case 4:
      return "Thursday";
    case 5:
      return "Friday";
    case 6:
      return "Saturday";
    case 7:
      return "Sunday";
    default:
      return "Unknown";
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final weekdayStr = _weekdayToString(now.weekday);
    final dateStr = "${now.day}/${now.month}/${now.year}";
    final titleString = "$weekdayStr, $dateStr";

    return Scaffold(
      backgroundColor: const Color(0xFF2D3953),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD9D9D9),
        title: Text(titleString),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications coming soon!')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('You selected tab: $_selectedIndex'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed, // All five buttons show labels
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const StatisticsPage()),
            );
          } else if (index == 2) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const AiAssistantPage()),
            );
          } else if (index == 3) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const CalendarPage()),
            );
          } else if (index == 4) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const PersonalPage()),
            );
          }
        },
        // Remove "const" so we can use asset images
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'statistics',
          ),
          // Use ImageIcon or an Image widget for your custom asset
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/robot_icon.png'),
              width: 50,
              height: 50,
            ),
            label: 'AI assestant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}
//hello
