import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aztec Map',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 0;

  final List<String> screenNames = [
    'Welcome',
    'Period Timer',
    'Place List',
    'Map',
    'Detail',
    'Credits',
    'Settings',
  ];

  void _selectScreen(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  void _navigateToPeriodTimerScreen() {
    setState(() {
      _currentScreenIndex = 1; // Navigate to the PeriodTimerScreen
    });
  }

  void startCountdownTimer() {
    // Call the startCountdown function in PeriodTimerScreen
    final periodTimerScreen = _buildCurrentScreen() as PeriodTimerScreen?;
    periodTimerScreen?.startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aztec App'),
      ),
      drawer: AppDrawer(
        screenNames: screenNames,
        selection: _currentScreenIndex,
        onScreenSelected: _selectScreen,
        navigateToPeriodTimerScreen: _navigateToPeriodTimerScreen,
        context: context, // Pass the context from the widget tree on the left
      ),
      body: _buildCurrentScreen(), // Build the currently selected screen
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return WelcomeScreen(startCountdownTimer: startCountdownTimer);
      case 1:
        return PeriodTimerScreen(
          startCountdown: startCountdownTimer,
        );
      case 2:
        return PlaceListScreen();
      case 3:
        return MapScreen();
      case 4:
        return DetailScreen();
      case 5:
        return CreditsScreen();
      case 6:
        return SettingsScreen();
      default:
        return WelcomeScreen(startCountdownTimer: startCountdownTimer);
    }
  }
}

class WelcomeScreen extends StatelessWidget {
  final VoidCallback startCountdownTimer;

  WelcomeScreen({required this.startCountdownTimer});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/BHS Front Steps-HDR1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Aztec App',
                    style: TextStyle(
                      fontFamily: 'BarberOutline',
                      fontSize: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Text(
                              '\n' 'Lorem Ipsum',
                              style: TextStyle(
                                fontFamily: 'Economica',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Text(
                              '\n' 'Lorem Ipsum',
                              style: TextStyle(
                                fontFamily: 'Economica',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: startCountdownTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Start',
                        style: TextStyle(
                          fontFamily: 'Arial Narrow',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Brought to you by:',
                    style: TextStyle(
                      fontFamily: 'Arial Narrow',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Add the button functionality
                    },
                    child: Text(
                      'Credits',
                      style: TextStyle(
                        fontFamily: 'Arial Narrow',
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('images/aztec logo.png'),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('images/bhs cte logo.png'),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child:
                      Image.asset('images/bhs computer science students logo.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Period {
  final String name;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  Period({
    required this.name,
    required this.startTime,
    required this.endTime,
  });
}

class PeriodTimerScreen extends StatefulWidget {
  final VoidCallback startCountdown;

  PeriodTimerScreen({required this.startCountdown});

  @override
  _PeriodTimerScreenState createState() => _PeriodTimerScreenState();
}

class _PeriodTimerScreenState extends State<PeriodTimerScreen> {
  final List<Period> periodList = [
    Period(
      name: '5m Pass',
      startTime: TimeOfDay(hour: 7, minute: 10),
      endTime: TimeOfDay(hour: 7, minute: 14),
    ),
    Period(
      name: 'Period 1',
      startTime: TimeOfDay(hour: 7, minute: 15),
      endTime: TimeOfDay(hour: 8, minute: 7),
    ),
    Period(
      name: '5m Pass',
      startTime: TimeOfDay(hour: 8, minute: 8),
      endTime: TimeOfDay(hour: 8, minute: 12),
    ),
    Period(
      name: 'Period 2',
      startTime: TimeOfDay(hour: 8, minute: 13),
      endTime: TimeOfDay(hour: 9, minute: 5),
    ),
    Period(
      name: '5m Pass',
      startTime: TimeOfDay(hour: 9, minute: 6),
      endTime: TimeOfDay(hour: 9, minute: 10),
    ),
    Period(
      name: 'Period 3',
      startTime: TimeOfDay(hour: 9, minute: 11),
      endTime: TimeOfDay(hour: 10, minute: 7),
    ),
    Period(
      name: 'Lunch A',
      startTime: TimeOfDay(hour: 10, minute: 8),
      endTime: TimeOfDay(hour: 10, minute: 37),
    ),
    Period(
      name: 'Period 4a',
      startTime: TimeOfDay(hour: 10, minute: 38),
      endTime: TimeOfDay(hour: 11, minute: 30),
    ),
    Period(
      name: '5m Pass',
      startTime: TimeOfDay(hour: 11, minute: 31),
      endTime: TimeOfDay(hour: 11, minute: 35),
    ),
    Period(
      name: 'Period 4b',
      startTime: TimeOfDay(hour: 11, minute: 36),
      endTime: TimeOfDay(hour: 12, minute: 28),
    ),
    Period(
      name: 'Lunch B',
      startTime: TimeOfDay(hour: 12, minute: 29),
      endTime: TimeOfDay(hour: 13, minute: 0),
    ),
    Period(
      name: '5m Pass',
      startTime: TimeOfDay(hour: 13, minute: 1),
      endTime: TimeOfDay(hour: 13, minute: 5),
    ),
    Period(
      name: 'Period 5',
      startTime: TimeOfDay(hour: 13, minute: 6),
      endTime: TimeOfDay(hour: 13, minute: 58),
    ),
    Period(
      name: '5m Pass',
      startTime: TimeOfDay(hour: 13, minute: 59),
      endTime: TimeOfDay(hour: 14, minute: 3),
    ),
    Period(
      name: 'Period 6',
      startTime: TimeOfDay(hour: 14, minute: 4),
      endTime: TimeOfDay(hour: 14, minute: 56),
    ),
    Period(
      name: '5m Pass',
      startTime: TimeOfDay(hour: 14, minute: 57),
      endTime: TimeOfDay(hour: 15, minute: 1),
    ),
    Period(
      name: 'Period 7',
      startTime: TimeOfDay(hour: 15, minute: 2),
      endTime: TimeOfDay(hour: 15, minute: 30),
    ),
    // Add a fallback period to represent when school is not in session
    Period(
      name: 'No School',
      startTime: TimeOfDay(hour: 0, minute: 0),
      endTime: TimeOfDay(hour: 0, minute: 0),
    ),
  ];

  late Timer _timer;
  Duration _countdownDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    final currentTime = TimeOfDay.now();
    final currentPeriod = periodList.firstWhere(
          (period) => isTimeOfDayBetween(currentTime, period.startTime, period.endTime),
      orElse: () => Period(
        name: 'No School',
        startTime: TimeOfDay(hour: 0, minute: 0),
        endTime: TimeOfDay(hour: 0, minute: 0),
      ),
    );

    if (currentPeriod != null) {
      final startTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        currentPeriod.startTime.hour,
        currentPeriod.startTime.minute,
      );

      final currentTimeDT = DateTime.now();

      setState(() {
        _countdownDuration = startTime.difference(currentTimeDT);
      });

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownDuration.inSeconds > 0) {
            _countdownDuration -= const Duration(seconds: 1);
          } else {
            timer.cancel();
            startNextPeriodCountdown();
          }
        });
      });
    } else {
      setState(() {
        _countdownDuration = Duration.zero;
      });
    }
  }

  void startNextPeriodCountdown() {
    final now = TimeOfDay.now();
    final currentIndex = periodList.indexWhere(
          (period) =>
      period.startTime.hour > now.hour ||
          (period.startTime.hour == now.hour && period.startTime.minute > now.minute),
    );

    if (currentIndex != -1 && currentIndex < periodList.length - 1) {
      final currentPeriod = periodList[currentIndex];
      final nextPeriod = periodList[currentIndex + 1];

      final startTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        currentPeriod.endTime.hour,
        currentPeriod.endTime.minute,
      );
      final endTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        nextPeriod.startTime.hour,
        nextPeriod.startTime.minute,
      );

      final durationDifference = endTime.difference(startTime);
      setState(() {
        _countdownDuration = durationDifference;
      });
      startCountdown();
    } else {
      setState(() {
        _countdownDuration = Duration.zero;
      });
    }
  }

  bool isTimeOfDayBetween(
      TimeOfDay timeToCheck,
      TimeOfDay startTime,
      TimeOfDay endTime,
      ) {
    final now = DateTime.now();
    final currentTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeToCheck.hour,
      timeToCheck.minute,
    );
    final start = DateTime(
      now.year,
      now.month,
      now.day,
      startTime.hour,
      startTime.minute,
    );
    final end = DateTime(
      now.year,
      now.month,
      now.day,
      endTime.hour,
      endTime.minute,
    );

    return currentTime.isAfter(start) && currentTime.isBefore(end);
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    final formatter = DateFormat('h:mm a');
    return formatter.format(dateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Text(
                _countdownDuration != Duration.zero
                    ? _countdownDuration.inSeconds > 0
                    ? 'Countdown: ${_countdownDuration.inMinutes}m ${_countdownDuration.inSeconds.remainder(60)}s'
                    : 'Time Up!'
                    : 'No School',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: periodList.length,
                itemBuilder: (context, index) {
                  final period = periodList[index];
                  return ListTile(
                    title: Text(
                      period.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      '${formatTimeOfDay(period.startTime)} - ${formatTimeOfDay(period.endTime)}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Place List Screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Map Screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Detail Screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class CreditsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Credits Screen',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20), // Add some spacing

            // Programming Lead
            Text(
              'Programming Lead, Facilitator: \n'
                  'Timothy Brinkley',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20), // Add spacing

            // Current Student Programmers - 2023
            Text(
              '2023',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Add spacing
            Text(
              'Student Programmers:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Samilyel Frazier',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Nehemiah Rocker',
              style: TextStyle(fontSize: 16.0),
            ),

            SizedBox(height: 20), // Add more spacing

            // Previous Student Programmers - 2019
            Text(
              '2019',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Add spacing
            Text(
              'Student Contributors:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Helped in numerous ways such as: \n'
                  'finding GPS coordinates, taking pictures, \n'
                  'and coding.',
              style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            Text(
              'Mikayla Singkum',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Michael Rodriguez',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Alan Avila Nenenses',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Liliana Martina Ortega',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Anthony Laulu',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Johnny Lopez',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Robert Gibson',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Jacob Duke',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Gabriela Contreras',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Miles Washington',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Mario Jaramillo',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Ian Carson',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Vivian Gonzales',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Christian Mitchell',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Nathaniel Karres',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Mason Soberg',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}



class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Timer'),
            Tab(text: 'Map'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TimerSettings(),
          MapSettings(),
        ],
      ),
    );
  }
}

class TimerSettings extends StatefulWidget {
  @override
  _TimerSettingsState createState() => _TimerSettingsState();
}

class _TimerSettingsState extends State<TimerSettings>
    with SingleTickerProviderStateMixin {
  late TabController _subTabController;

  @override
  void initState() {
    super.initState();
    _subTabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _subTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _subTabController,
          tabs: [
            Tab(
              child: Text(
                'Regular',
                style: TextStyle(
                  color: Colors.black, // Change text color to black
                  fontWeight: FontWeight.bold, // Make text bold
                ),
              ),
            ),
            Tab(
              child: Text(
                'Minimum',
                style: TextStyle(
                  color: Colors.black, // Change text color to black
                  fontWeight: FontWeight.bold, // Make text bold
                ),
              ),
            ),
            Tab(
              child: Text(
                'Assembly',
                style: TextStyle(
                  color: Colors.black, // Change text color to black
                  fontWeight: FontWeight.bold, // Make text bold
                ),
              ),
            ),
            Tab(
              child: Text(
                'Finals',
                style: TextStyle(
                  color: Colors.black, // Change text color to black
                  fontWeight: FontWeight.bold, // Make text bold
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _subTabController,
            children: [
              ScheduleSettings(scheduleType: 'Regular'),
              ScheduleSettings(scheduleType: 'Minimum'),
              ScheduleSettings(scheduleType: 'Assembly'),
              ScheduleSettings(scheduleType: 'Finals'),
            ],
          ),
        ),
      ],
    );
  }
}


class ScheduleSettings extends StatelessWidget {
  final String scheduleType;

  ScheduleSettings({required this.scheduleType});

  @override
  Widget build(BuildContext context) {
    // Implement your specific settings UI based on the scheduleType
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text('Settings for $scheduleType Schedule'),
    );
  }
}

class MapSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your map-related settings UI here
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text('Map Settings'),
    );
  }
}


class AppDrawer extends StatelessWidget {
  final List<String> screenNames;
  final int selection;
  final ValueChanged<int> onScreenSelected;
  final VoidCallback navigateToPeriodTimerScreen;
  final BuildContext context;

  AppDrawer({
    required this.screenNames,
    required this.selection,
    required this.onScreenSelected,
    required this.navigateToPeriodTimerScreen,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: screenNames.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Aztec App',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Beta',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }

          final itemIndex = index - 1;
          final isSelected = itemIndex == selection;

          return ListTile(
            title: Text(
              screenNames[itemIndex],
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            onTap: () {
              if (itemIndex == 1) {
                navigateToPeriodTimerScreen();
              } else {
                onScreenSelected(itemIndex);
              }

              Navigator.pop(context); // Close the drawer
            },
          );
        },
      ),
    );
  }
}
