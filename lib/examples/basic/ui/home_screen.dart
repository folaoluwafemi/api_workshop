import 'package:api_workshop/examples/basic/data/bored_activity_source.dart';
import 'package:api_workshop/examples/basic/data/http_bored_activity_source.dart';
import 'package:api_workshop/examples/basic/model/bored_info.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final BoredActivitySource _source;

  @override
  void initState() {
    _source = HttpBoredActivitySource();
    super.initState();
  }

  BoredActivity activity = const BoredActivity(
    activity: "Catch up on world news",
    type: 'recreational',
    participants: 1,
    price: 200,
  );

  String? error;

  Future<void> generateActivity() async {
    try {
      setState(() {
        error = null;
      });
      activity = await _source.getRandomActivity();
      setState(() {});
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Workshop Demo'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 200),
          ActivityWidget(activity: activity),
          const SizedBox(height: 50),
          if (error != null)
            Text(
              'Error: $error',
              style: TextStyle(color: scheme.error),
            ),
          const SizedBox(height: 200),
          ElevatedButton(
            onPressed: generateActivity,
            child: const Text(
              'Generate',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityWidget extends StatelessWidget {
  final BoredActivity activity;

  const ActivityWidget({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Activity: ',
                style: TextStyle(
                  fontSize: 20,
                  color: scheme.primary,
                ),
              ),
              Text(
                activity.activity,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Type: ',
                style: TextStyle(
                  fontSize: 16,
                  color: scheme.primary,
                ),
              ),
              Text(
                activity.type,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Participants: ',
                style: TextStyle(
                  fontSize: 16,
                  color: scheme.secondary,
                ),
              ),
              Text(
                activity.participants.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Price: ',
                style: TextStyle(
                  fontSize: 16,
                  color: scheme.secondary,
                ),
              ),
              Text(
                '\$${activity.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
