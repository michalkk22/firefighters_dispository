import 'package:firefighters_dispository/domain/area.dart';
import 'package:firefighters_dispository/domain/event/periodic_random_event_stream.dart';
import 'package:firefighters_dispository/service/dispository/dispository.dart';
import 'package:firefighters_dispository/domain/logs_manager.dart';
import 'package:flutter/material.dart';

class DispositoryLogsWidget extends StatefulWidget {
  const DispositoryLogsWidget({super.key});

  @override
  State<DispositoryLogsWidget> createState() => _DispositoryLogsWidgetState();
}

class _DispositoryLogsWidgetState extends State<DispositoryLogsWidget> {
  final LogsManager _logsManager = LogsManager();

  bool _isStarted = false;

  void _start() {
    setState(() {
      final randomEventStream =
          PeriodicRandomEventStream(area: Area.fromRepo());
      Dispository(events: randomEventStream.events());
      _isStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('building DispositoryLogsWidget');
    return _isStarted
        ? StreamBuilder<List<String>>(
            stream: _logsManager.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final logs = snapshot.data!;
                return ListView.builder(
                  itemCount: logs.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(logs[index]),
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          )
        : TextButton(
            onPressed: _start,
            child: const Text('Start'),
          );
  }
}
