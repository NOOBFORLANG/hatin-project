import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 코드 리펙토링, 반응형

class RoutinAddPage extends StatefulWidget {
  const RoutinAddPage({Key? key}) : super(key: key);

  @override
  State<RoutinAddPage> createState() => _RoutinAddPageState();
}

class _RoutinAddPageState extends State<RoutinAddPage> {
  List<bool> _dowColor = List<bool>.filled(7, false);
  // 요일 클릭 시 색 변화를 위한 List , false = 클릭전 , true = 클릭후
  TimeOfDay initialTime = const TimeOfDay(hour: 09, minute: 00);
  // 현재시간 변수
  @override
  Widget build(BuildContext context) {
    //final double screenWidth = MediaQuery.of(context).size.width; // 반응형 위한 넓이
    //final double screenheight = MediaQuery.of(context).size.height; // 반응형 위한 높이
    //
    //print("스크린 넓이 {$screenWidth}"); // 392
    //print("스크린 높이 {$screenheight}"); // 781

    return Scaffold(
      appBar: _appbar(),
      body: _body(),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _routinCreateButton(), // 루틴 추가하기 버튼
    );
  }

// 앱 바 부분
  PreferredSizeWidget _appbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.128), // from height :100
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Text(
              "루틴 추가하기",
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

// |내용부분| "이름 입력"
  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _nameField(), // 이름 입력 필드 : 이름 입력 , 수정 아이콘
          _routinTimeText(), // 루틴 시간
          _routinTimeAdd(), // 루틴 시간 설정
          _routinRepeatText(), // 루틴 반복
          _routinRepeatSelection(), // 루틴 반복 요일 선택
          _routinAlarm(), // 알람 , 스위치 On/Off
          _routinMemoText(), // 메모
          _routinMemoTyping(), // 메모 타이핑 공간
        ],
      ),
    );
  }

// |이름 입력| , 수정 아이콘
  Widget _nameField() {
    String routinName = "이름 입력";
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1, // left:40, top:15
              top: MediaQuery.of(context).size.height * 0.019),
          child: Text(
            routinName,
            style: const TextStyle(fontSize: 18.0, color: Color(0xff9B9B9B)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.020, // left:8, top:15
              top: MediaQuery.of(context).size.height * 0.019),
          child: GestureDetector(
            onTap: () {
              print("icons.edit이 눌려졌다!");
            },
            child: const Icon(
              Icons.edit,
              size: 31,
            ),
          ),
        )
      ],
    );
  }

// |루틴 시간| 텍스트
  Widget _routinTimeText() {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1, //left:40, top:40
          top: MediaQuery.of(context).size.height * 0.0512,
          right: MediaQuery.of(context).size.width * 0.1),
      child: const Text(
        "시간 설정",
        style: TextStyle(fontSize: 16.0, color: Color(0xff111111)),
      ),
    );
  }

// |루틴 시간| 아래 오전 시간 박스
  Widget _routinTimeAdd() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Center(
        child: SizedBox(
          width:
              MediaQuery.of(context).size.width * 0.84, //width:335, height:45
          height: MediaQuery.of(context).size.height * 0.0571,
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffF1F3F5),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(68.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(68.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintText:
                    "${initialTime.period.toString().split('.')[1]} ${initialTime.hour} ${initialTime.minute}",
                hintStyle: TextStyle(color: Color(0xff9B9B9B), fontSize: 18)),
            onTap: () async {
              final TimeOfDay? timeOfDay = await showTimePicker(
                context: context,
                initialTime: initialTime,
              );
              if (timeOfDay != null) {
                setState(() {
                  initialTime = timeOfDay;
                });
                print("$initialTime");
              }
            },
          ),
        ),
      ),
    );
  }

// |루틴 반복| 텍스트
  Widget _routinRepeatText() {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1, //left:40, top:30
          top: MediaQuery.of(context).size.height * 0.038,
          right: MediaQuery.of(context).size.width * 0.1),
      child: const Text(
        "루틴 반복",
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  // |루틴 반복| 아래 반복할 날짜 선택
  Widget _routinRepeatSelection() {
    final List<String> DOW = ["일", "월", "화", "수", "목", "금", "토"];
    // DOW = Day Of Weak
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1), // left:40
      child: Row(
        children: List.generate(
          DOW.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.2, vertical: 5),
            child: GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.082, // width:32
                height:
                    MediaQuery.of(context).size.height * 0.0576, // height:45
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  color:
                      !_dowColor[index] ? Color(0xffFe4F28) : Color(0xffF1F3F5),
                  // 요일 클릭 되기전 : 클릭후 Container 색 변화
                ),
                child: Center(
                  child: Text(
                    DOW[index],
                    style: TextStyle(
                      color:
                          !_dowColor[index] ? Colors.white : Color(0xff9B9B9B),
                      // 요일 클릭 되기전 : 클릭후 글자색 변화
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  _dowColor[index] = !_dowColor[index];
                  print(DOW[index]);
                });
              },
            ),
          ),
        ),
      ),
    );
  }

// |알람| , 스위치
  Widget _routinAlarm() {
    bool switchValue = true;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1, //left:40, top:30
              top: MediaQuery.of(context).size.height * 0.0384),
          child: const Text(
            "알림",
            style: TextStyle(fontSize: 16.0, color: Color(0xff111111)),
          ),
        ),
        Padding(
          // 알람 On/Off
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1, //left:40, top:5
              top: MediaQuery.of(context).size.height * 0.006402),
          child: Transform.scale(
            scale: 1.1,
            child: CupertinoSwitch(
                // 스위치
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                }),
          ),
        )
      ],
    );
  }

// |메모| 텍스트
  Widget _routinMemoText() {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1, //left:40, top:25
          top: MediaQuery.of(context).size.height * 0.03201),
      child: const Text(
        "메모",
        style: TextStyle(fontSize: 16.0, color: Color(0xff111111)),
      ),
    );
  }

//|메모| 타이핑 공간
  Widget _routinMemoTyping() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        //
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.051, //left:20, top:10
            top: MediaQuery.of(context).size.height * 0.0128,
            right: MediaQuery.of(context).size.width * 0.051),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.854, //width335
            height: 150, // 150 으로 설정해야 스크롤을 내려서 메모 내용을 볼 수 있음.
            child: TextField(
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffF1F3F5),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText: "메모 입력",
                hintStyle: TextStyle(color: Color(0xff9B9B9B9B), fontSize: 14),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.transparent)),
              ),
            ),
          ),
        ),
      ),
    );
  }

// 루틴 생성 버튼
  Widget _routinCreateButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.905, //width:355, height:56
        height: MediaQuery.of(context).size.height * 0.064020,
        child: FloatingActionButton.extended(
            backgroundColor: Color(0xffFe4F28),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              Navigator.of(context).pop();
              //print("루틴 생성 버튼 클릭");
            },
            label: const Text(
              "루틴 생성",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
            )),
      ),
    );
  }
}
