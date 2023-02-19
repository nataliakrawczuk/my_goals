import 'package:flutter/material.dart';
import 'package:my_goals/features/pages/user_profile.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GOALS'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserProfile(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const Center(child: Text('Jeden'));
        }
        if (currentIndex == 1) {
          return const Center(child: Text('dwa'));
        }
        if (currentIndex == 2) {
          return const Center(child: Text('trzy'));
        }
        return const Center(child: Text('Jeden'));
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Zadania'),
          BottomNavigationBarItem(icon: Icon(Icons.add_task), label: 'Dodaj'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all), label: 'Wykonane'),
        ],
      ),
    );
  }
}
