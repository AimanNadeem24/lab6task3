import 'package:flutter/material.dart';

void main() {
  runApp(AimanGirlApp());
}

class AimanGirlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Aimans Dashboard')),
        ),
        body: DashboardGrid(),
      ),
    );
  }
}

class DashboardGrid extends StatelessWidget {
  final List<String> cardDescriptions = [
    'Aspiring Visionary, Lifelong Learner, Future Builder',
    'Turning ideas into impact, one step at a time',
    'Curious mind with a passion for innovation',
    'On a journey to transform potential into progress',
    'Engineer of solutions, explorer of possibilities',
    'One life, limitless opportunities',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: cardDescriptions.length, // Number of cards
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle card tap
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Profile $index'),
                  content: Text('Click to see more details $index.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info,
                      size: 50,
                      color: const Color.fromARGB(255, 84, 141, 129),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'profile $index',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      cardDescriptions[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 113, 91, 138),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
