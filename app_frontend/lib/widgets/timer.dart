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


        //The Timer along with arrow buttons:
        SizedBox(
          width: 350,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

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

              const SizedBox(height: 5),

              AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 50),
                style: TextStyle(
                  fontSize: isRunning ? 80 : 60,
                  fontWeight: FontWeight.bold,
                  color: isRunning ? Colors.white : Color(0xFFB2BCBD),
                ),

                child: Text(formatTime(secondsLeft)),
              ),

              const SizedBox(height: 5),

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
        ),

        const SizedBox(height: 50),

        //Start,Pause and Stop buttons:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child:
                  isRunning
                      ? IconButton(
                        onPressed: () {
                          pauseTimer();
                        },
                        style: IconButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor: Color(0xFF2C2C2E),
                        ),
                        icon: const Icon(
                          Icons.pause,
                          color: Color(0xFFB2BCBD),
                          size: 40,
                        ),
                      )
                      : IconButton(
                        onPressed: () {
                          startTimer();
                        },
                        style: IconButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,

                          backgroundColor: Color(0xFF007AFF),
                        ),
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Color(0xFFB2BCBD),
                          size: 40,
                        ),
                      ),
            ),

            const SizedBox(width: 40),

            IconButton(
              onPressed: () {
                stopTimer();
              },
              style: IconButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                backgroundColor: Color(0xFFFF3B30),
              ),
              icon: const Icon(Icons.stop, color: Color(0xFFB2BCBD), size: 40),
            ),
          ],
        ),

        const SizedBox(height: 50),

        //Current task display
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
