import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Flexible(
            flex: 4,
            child: ListView(
              children: const [
                Reciept(),
                Reciept(),
                Reciept(),
                Reciept(),
                Reciept(),
                Reciept(),
                Reciept(),
                Reciept(),
                Reciept(),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class Reciept extends StatelessWidget {
  const Reciept({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'title',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Text('2023-01-25 18:54'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '60000 won',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Text('members'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
