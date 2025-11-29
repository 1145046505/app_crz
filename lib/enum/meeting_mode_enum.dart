enum MeetingMode {
  meeting(name: "会议模式", code: 0),
  free(name: "空闲模式", code: 1);

  const MeetingMode({required this.name, required this.code});

  final String name;
  final int code;
}
