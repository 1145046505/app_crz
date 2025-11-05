import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isPressing1 = false;
  bool _isPressing2 = false;

  @override
  Widget build(BuildContext context) {
    const width = 150.0;
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 会议按钮
                  GestureDetector(
                    onTapDown: (val) {
                      setState(() {
                        _isPressing1 = true;
                      });
                    },
                    onTapUp: (val) {
                      setState(() {
                        _isPressing1 = false;
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        _isPressing1 = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: width,
                      height: width,
                      decoration: BoxDecoration(
                        color: _isPressing1
                            ? Colors.deepPurple[900]
                            : Colors.deepPurple[600],
                        borderRadius: BorderRadius.circular(width),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.meeting_room,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "会议",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 100),

                  GestureDetector(
                    onTapDown: (val) {
                      setState(() {
                        _isPressing2 = true;
                      });
                    },
                    onTapUp: (val) {
                      setState(() {
                        _isPressing2 = false;
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        _isPressing2 = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: width,
                      height: width,
                      decoration: BoxDecoration(
                        color:
                            _isPressing2 ? Colors.blue[600] : Colors.blue[400],
                        borderRadius: BorderRadius.circular(width),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "空闲",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
