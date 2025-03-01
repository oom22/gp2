import 'package:flutter/material.dart';
import 'main.dart'; // For MyHomePage
import 'statistics_page.dart'; // For StatisticsPage
import 'ai_assistant_page.dart'; // For AiAssistantPage
import 'calendar_page.dart'; // For CalendarPage

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  // Bottom nav bar index: 4 => "Profile"
  int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Dark background color
      backgroundColor: const Color(0xFF2D3953),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2D3953),
        elevation: 0, // No shadow
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Implement Settings page
              debugPrint('Settings tapped');
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // -- Profile Avatar & Edit Button --
            const SizedBox(height: 8),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar_placeholder.png'),
              // Or NetworkImage(...) if you have a URL
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // TODO: Implement "Edit Profile"
              },
              child: const Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // -- Productivity Hub Section --
            _buildSectionHeader('Productivity Hub'),
            _buildSectionItem(
              title: 'Habit',
              icon: Icons.repeat, // Example icon
              onTap: () {
                // TODO: Navigate to Habit screen
              },
            ),
            _buildSectionItem(
              title: 'Statistics',
              icon: Icons.bar_chart_outlined,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const StatisticsPage()),
                );
              },
            ),
            _buildSectionItem(
              title: 'Task',
              icon: Icons.check_circle_outline,
              onTap: () {
                // TODO: Navigate to Task screen
              },
            ),
            _buildSectionItem(
              title: 'Calendar',
              icon: Icons.calendar_month,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const CalendarPage()),
                );
              },
            ),

            const SizedBox(height: 24),

            // -- Support & About Section --
            _buildSectionHeader('Support & About'),
            _buildSectionItem(
              title: 'Help & Support',
              icon: Icons.help_outline,
              onTap: () {
                // TODO: Navigate to Help & Support
              },
            ),
            _buildSectionItem(
              title: 'Terms and Policies',
              icon: Icons.description,
              onTap: () {
                // TODO: Navigate to Terms & Policies
              },
            ),

            const SizedBox(height: 24),

            // -- Actions Section --
            _buildSectionHeader('Actions'),
            _buildSectionItem(
              title: 'Language',
              icon: Icons.language,
              onTap: () {
                // TODO: Implement language settings
              },
            ),
            _buildSectionItem(
              title: 'Dark Mode',
              icon: Icons.dark_mode,
              onTap: () {
                // TODO: Implement dark mode toggle
              },
            ),
            _buildSectionItem(
              title: 'Report a Problem',
              icon: Icons.report_problem_outlined,
              onTap: () {
                // TODO: Implement reporting
              },
            ),
            _buildSectionItem(
              title: 'Log Out',
              icon: Icons.logout,
              onTap: () {
                // TODO: Implement log out
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),

      // -- Bottom Nav Bar --
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Navigation
          if (index == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          } else if (index == 1) {
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
          }
          // index == 4 => already here
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'statistics',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/robot_icon.png',
              width: 40,
              height: 40,
            ),
            label: 'AI assistant',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'calendar',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Helper widget to build section headers
  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Helper widget to build list-style items with an icon
  Widget _buildSectionItem({
    required String title,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return Card(
      color:
          const Color(0xFF3B4A63), // A slightly lighter shade than background
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white),
      ),
    );
  }
}
