import 'package:firefighters_dispository/widgets/dispository_logs_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isSimulationStarted = false;

  void _startSimulation() {
    setState(() {
      _isSimulationStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(''),
      ),
      body: Center(
        child: _isSimulationStarted
            ? const DispositoryLogsWidget()
            : TextButton(
                onPressed: _startSimulation,
                child: const Text('Start'),
              ),
      ),
    );
  }
}
