import 'dart:async';
import 'package:flutter/material.dart';

class MainTimer extends StatefulWidget {
  const MainTimer({super.key});

  @override
  State<MainTimer> createState() => _MainTimerState();
}

class _MainTimerState extends State<MainTimer> {
  int totalTime = 1800;
  int secondsLeft = 1800;
  Timer? timer;
  bool isRunning = false;

  void startTimer() {
    if (isRunning || timer != null) return;

    setState(() {
      isRunning = true;
      secondsLeft = totalTime;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timerCallback) {
      if (secondsLeft > 0) {
        setState(() {
          secondsLeft--;
        });
      } else {
        timer?.cancel();
        isRunning = false;
      }
    });
  }

  void pauseTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
      setState(() {
        isRunning = false;
      });
    }
  }

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
    }
    setState(() {
      secondsLeft = totalTime;
      isRunning = false;
    });
  }

  void increaseTime() {
    if (!isRunning) {
      setState(() {
        totalTime += 1800;
        secondsLeft = totalTime;
      });
    }
  }

  void decreaseTime() {
    if (!isRunning) {
      setState(() {
        if (totalTime > 1800) {
          totalTime -= 1800;
          secondsLeft = totalTime;
        }
      });
    }
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue, width: 8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  decreaseTime();
                },
                icon: Icon(Icons.keyboard_arrow_up_rounded),
                iconSize: 50,
              ),

              const SizedBox(height: 30),

              Text(
                formatTime(secondsLeft),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              IconButton(
                onPressed: () {
                  increaseTime();
                },
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 50,
              ),
            ],
          ),
        ),

        const SizedBox(height: 50),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                startTimer();
              },
              child: const Icon(Icons.play_arrow),
            ),

            const SizedBox(width: 10),

            ElevatedButton(
              onPressed: () {
                pauseTimer();
              },
              child: const Icon(Icons.pause),
            ),

            const SizedBox(width: 10),

            ElevatedButton(
              onPressed: () {
                stopTimer();
              },
              child: const Icon(Icons.stop),
            ),
          ],
        ),

        const SizedBox(height: 50),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Current Task",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text("Study"),
          ],
        ),
      ],
    );
  }
}
