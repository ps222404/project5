import 'package:flutter/material.dart';
import 'package:project5mobile/service/Inlogservice.dart';
import 'package:project5mobile/service/prestatieservice.dart';
import 'package:project5mobile/models/Prestatie.dart';
import 'package:project5mobile/models/Oefening.dart';
import 'package:project5mobile/service/Oefeningenservice.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class PrestatiesCreate extends StatefulWidget {
  final int id;
  const PrestatiesCreate({required this.id, Key? key}) : super(key: key);

  @override
  _PrestatiesCreateState createState() => _PrestatiesCreateState();
}

class _PrestatiesCreateState extends State<PrestatiesCreate> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  int aantal = 0;
  String time = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Begin met jouw oefening'),
        backgroundColor: Color.fromRGBO(15, 238, 217, 100),
      ),
      body: Stack(
        children: [
          _buildBackground(),
          _buildOefeningWidget(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/oefeningen.jpg'),
          // Replace with your background image asset
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.85),
              BlendMode.dstATop), // Adjust opacity here
        ),
      ),
    );
  }

  Widget _buildOefeningWidget() {
    return FutureBuilder<Oefening>(
      future: OefeningService().getById(widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final oefening = snapshot.data!;
          return ListView(
            children: [
              ListTile(
                title: Image.asset(
                  'lib/assets/${oefening.gif}',
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${oefening.description}',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Text('${oefening.explanation}',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_stopWatchTimer.isRunning) {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                      _showAantalDialog();
                      final elapsedDuration = Duration(
                          milliseconds: _stopWatchTimer.rawTime.value.toInt());
                      time = _formatDuration(elapsedDuration);
                    } else {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white,
                    // foreground
                  ),
                  child: StreamBuilder<int>(
                    stream: _stopWatchTimer.rawTime,
                    initialData: 0,
                    builder: (context, snapshot) {
                      final value = snapshot.data!;
                      final displayTime = _formatDuration(Duration(milliseconds: value));
                      return Text(
                        'Stop Oefening: $displayTime',
                        style: TextStyle(fontSize: 18),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(
              'Error: ${snapshot.error}', style: TextStyle(fontSize: 20)));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _showAantalDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('hoeveel sets heb je gedaan'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                aantal = int.tryParse(value) ?? 0;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _submitPrestatie();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _submitPrestatie() {
    final elapsedDuration = Duration(
        milliseconds: _stopWatchTimer.rawTime.value.toInt());
    final time = _formatDuration(elapsedDuration);
    PrestatieService.post(widget.id, aantal, time, context);
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}
