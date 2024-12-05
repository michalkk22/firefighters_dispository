import 'package:firefighters_dispository/service/dispository_service/dispository.dart';
import 'package:firefighters_dispository/service/logs_manager/logs_manager.dart';
import 'package:flutter/material.dart';

class DispositoryLogsWidget extends StatefulWidget {
  const DispositoryLogsWidget({super.key});

  @override
  State<DispositoryLogsWidget> createState() => _DispositoryLogsWidgetState();
}

class _DispositoryLogsWidgetState extends State<DispositoryLogsWidget> {
  late Dispository _dispository;
  late TextEditingController _controller;
  final LogsManager _logsManager = LogsManager();

  @override
  void initState() {
    _dispository = Dispository();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
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
    );
  }
}
