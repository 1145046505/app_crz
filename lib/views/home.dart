import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/enum/meeting_mode_enum.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MeetingMode currentMode = MeetingMode.free;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    final buttonWidth = 150.0.w;
    final selectedColor = Color.fromARGB(180, 30, 136, 229);
    final unSelectedColor = Color.fromARGB(66, 238, 238, 238);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // 让背景图透出
        body: Stack(
          children: [
            // 毛玻璃背景层（模糊）
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withOpacity(0.2), // 半透明白色，增加朦胧感
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          toggleMode(MeetingMode.meeting);
                        },
                        color: currentMode == MeetingMode.meeting
                            ? selectedColor
                            : unSelectedColor,
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(buttonWidth),
                          ),
                        ),
                        child: SizedBox(
                          width: buttonWidth,
                          height: buttonWidth,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.computer,
                                  color: Colors.white,
                                  size: 44.sp,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  MeetingMode.meeting.name,
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                      ),
                      MaterialButton(
                        hoverElevation: 5,
                        onPressed: () {
                          toggleMode(MeetingMode.free);
                        },
                        color: currentMode == MeetingMode.free
                            ? selectedColor
                            : unSelectedColor,
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(buttonWidth),
                          ),
                        ),
                        child: SizedBox(
                          width: buttonWidth,
                          height: buttonWidth,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.free_breakfast_outlined,
                                  color: Colors.white,
                                  size: 44.sp,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  MeetingMode.free.name,
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toggleMode(MeetingMode mode) {
    print("change mode : $mode");
    setState(() {
      currentMode = mode;
    });
  }
}
