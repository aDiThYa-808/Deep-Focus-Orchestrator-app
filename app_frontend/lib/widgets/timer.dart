import 'dart:async';

import 'package:app_frontend/theme/colors.dart';
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
  bool timerIsActive = false;

  void startTimer() {
    if (isRunning || timer != null) return;

    setState(() {
      isPaused = false;
      isRunning = true;
      timerIsActive = true;
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
      timerIsActive = false;
    });
  }

  void increaseTime() {
    if (!isRunning && !isPaused) {
      setState(() {
        totalTime += 300;
        secondsLeft = totalTime;
      });
    }
  }

  void decreaseTime() {
    if (!isRunning && !isPaused) {
      setState(() {
        if (totalTime > 300) {
          totalTime -= 300;
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                minimumSize: Size(170, 100),
                backgroundColor: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: Icon(
                Icons.volume_off_rounded,
                size: 30,
                color: Color(0xFFFFFFFF),
              ),
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                minimumSize: Size(170, 100),
                backgroundColor: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: Icon(
                Icons.do_not_disturb_on_rounded,
                size: 30,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        //Timer and Progress Bar:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //The Timer along with arrow buttons:
            Container(
              width: 270,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                border: Border.all(
                  color: AppColors.hightlightColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  if (!isRunning && !isPaused)
                    IconButton(
                      onPressed: () {
                        decreaseTime();
                      },
                      style: IconButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_up_rounded,
                        size: 50,
                        color: AppColors.unselectedIconColor,
                      ),
                    ),

                  const SizedBox(height: 5),

                  AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 50),
                    style: TextStyle(
                      fontSize: isRunning ? 80 : 60,
                      fontWeight: FontWeight.bold,
                      color:
                          isRunning
                              ? AppColors.primaryTextColor
                              : AppColors.secondaryTextColor,
                    ),

                    child: Text(formatTime(secondsLeft)),
                  ),

                  const SizedBox(height: 5),

                  if (!isRunning && !isPaused)
                    IconButton(
                      onPressed: () {
                        increaseTime();
                      },
                      style: IconButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 50,
                        color: AppColors.unselectedIconColor,
                      ),
                    ),
                ],
              ),
            ),

            //Rotated Linear progress bar:
            Container(
              height: 300,
              width: 80,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                border: Border.all(
                  color: AppColors.hightlightColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: RotatedBox(
                quarterTurns: -1,
                child: LinearProgressIndicator(
                  value: secondsLeft / totalTime,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.hightlightColor),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  minHeight: 300,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        //Start,Pause and Stop buttons:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child:
                  isRunning
                      ? ElevatedButton(
                        onPressed: () {
                          pauseTimer();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(170, 60),
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor: AppColors.activeButtonColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        child: const Icon(
                          Icons.pause_rounded,
                          color: Color(0xFFFFFFFF),
                          size: 40,
                        ),
                      )
                      : ElevatedButton(
                        onPressed: () {
                          startTimer();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: Size(170, 60),
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor: AppColors.primaryButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: Color(0xFFFFFFFF),
                          size: 40,
                        ),
                      ),
            ),

            ElevatedButton(
              onPressed: () {
                stopTimer();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(170, 60),
                splashFactory: NoSplash.splashFactory,
                backgroundColor:
                    timerIsActive
                        ? AppColors.primaryButtonColor
                        : AppColors.disabledButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: const Icon(
                Icons.stop_rounded,
                color: Color(0xFFFFFFFF),
                size: 40,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        //Current task display
        Container(
          width: 360,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
                  color: AppColors.hightlightColor,
                  width: 2,
                ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppColors.secondary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Current Task",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const Text(
                "Study",
                style: TextStyle(color: AppColors.secondaryTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
