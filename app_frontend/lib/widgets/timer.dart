import 'dart:async';
import 'package:flutter/material.dart';

class MainTimer extends StatefulWidget {
  const MainTimer({super.key});

  @override
  State<MainTimer> createState() => _MainTimerState();
}

class _MainTimerState extends State<MainTimer> {
  int totalTime = 900;
  int secondsLeft = 900;
  Timer? timer;
  bool isRunning = false;
  bool isPaused = false;

  void startTimer() {
    if (isRunning || timer != null) return;

    setState(() {
      isPaused = false;
      isRunning = true;
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
        isPaused = true;
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
      isPaused = false;
    });
  }

  void increaseTime() {
    if (!isRunning && !isPaused) {
      setState(() {
        totalTime += 900;
        secondsLeft = totalTime;
      });
    }
  }

  void decreaseTime() {
    if (!isRunning && !isPaused) {
      setState(() {
        if (totalTime > 900) {
          totalTime -= 900;
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
          width: 350,
          height: 350,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF1A163C),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  if (!isRunning && !isPaused)
                    IconButton(
                      onPressed: () {
                        decreaseTime();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_up_rounded,
                        size: 50,
                        color: Color(0xFFB2BCBD),
                      ),
                    ),

                  const SizedBox(height: 25),

                  AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 50),
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: isRunning ? Colors.white : Color(0xFFB2BCBD),
                    ),

                    child: Text(formatTime(secondsLeft)),
                  ),

                  const SizedBox(height: 25),

                  if (!isRunning && !isPaused)
                    IconButton(
                      onPressed: () {
                        increaseTime();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 50,
                        color: Color(0xFFB2BCBD),
                      ),
                    ),
                ],
              ),

              SizedBox(
                height: 300,
                width: 60,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1A163C), // Background color
                    border: Border.all(color: Color(0xFFB2BCBD), width: 2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      12,
                    ), // Ensure content also clips to rounded corners
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        value: secondsLeft / totalTime,
                        backgroundColor:
                            Colors.transparent, // Already set by container
                        color: Color(0xFF26137C),
                      ),
                    ),
                  ),
                ),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A163C),
                shape: RoundedRectangleBorder(),
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Color(0xFFB2BCBD),
                size: 40,
              ),
            ),

            const SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                pauseTimer();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A163C),
                shape: RoundedRectangleBorder(),
              ),
              child: const Icon(
                Icons.pause,
                color: Color(0xFFB2BCBD),
                size: 40,
              ),
            ),

            const SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                stopTimer();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A163C),
                shape: RoundedRectangleBorder(),
              ),
              child: const Icon(Icons.stop, color: Color(0xFFB2BCBD), size: 40),
            ),
          ],
        ),

        const SizedBox(height: 50),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Current Task",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB2BCBD),
              ),
            ),
            const Text("Study", style: TextStyle(color: Color(0xFFB2BCBD))),
          ],
        ),
      ],
    );
  }
}
