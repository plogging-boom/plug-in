import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plug_in/plug_in_bottom_navigation_bar.dart';
import 'package:plug_in/provider/route_provider.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';
import 'package:plug_in/ui/component/plug_in_text.dart';
import 'package:provider/provider.dart';

import 'plug_in_route_detail_info.dart';

class PlugInRouteDetail extends StatelessWidget {
  final RouteDetail routeDetail;

  const PlugInRouteDetail({
    Key? key,
    required this.routeDetail,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                userInform(context),
                plugDistanceMap(
                    routeDetail.pluggingDistance, routeDetail.userImageUrl),
                SizedBox(
                  height: 15.0,
                ),
                timeAndKcal(routeDetail.pluggingTime, routeDetail.kcal),
                userMemo(routeDetail.memo!),
              ],
            ),
          ),
          bottomNavigationBar: const PlugInBottomNavigationBar()),
    );
  }

  // 기능 -> provider
  // ui -> view
  Widget userInform(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Image.asset(routeDetail.userImageUrl),
          margin: const EdgeInsets.all(20.0),
          height: 70.0,
          width: 70.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
        const PlugInText(
          'Plugging User',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        IconButton(
            padding: const EdgeInsets.only(left: 150.0),
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.back,
              size: 30,
              color: Colors.white,
              textDirection: TextDirection.rtl,
            ))
      ],
    );
  }

  Widget plugDistanceMap(double pluggingDistance, String imagerl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 50.0),
          child: PlugInText(routeDetail.pluggingDistance.toString() + 'km',
              color: Colors.black, fontSize: 50.0, fontWeight: FontWeight.bold),
        ),
        Center(
          child: PlugInContainer(
            height: 250.0,
            width: 330.0,
            color: Colors.white,
            child: Image.asset(
              routeDetail.pluggingMapImage,
              fit: BoxFit.fill,
            ),
            useShadow: false,
          ),
        )
      ],
    );
  }

  Widget timeAndKcal(double time, int kcal) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Column(
        children: <Widget>[
          const Center(
              child: PlugInText('시간',
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          Center(
              child: PlugInText(routeDetail.pluggingTime.toString() + '시간 분',
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold))
        ],
      ),
      Column(
        children: <Widget>[
          const Center(
              child: PlugInText('칼로리',
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          Center(
            child: PlugInText(routeDetail.kcal.toString() + 'Kcal',
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          )
        ],
      )
    ]);
  }

  //TODO : 사용자의 메모 입력 값, 형태에 따라 fireStore Db CRUD 적용시키기
  //TODO : 주원이랑 class 통일 시키고 , 마이페이지 생성 시작.
  Widget userMemo(String memo) {
    return Flexible(
      fit: FlexFit.loose,
      child: Stack(
        children: [
          Positioned(
            top: 37.0,
            child: Consumer<RouteProvider>(
              builder: (context, routeProvider, child) => Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 150.0,
                width: 390.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          offset: Offset(7, 7))
                    ]),
                child: Center(
                    child: routeProvider.isPressed
                        ? memoContent()
                        // 현재 isPressed = false => plugInContainer , memoButton 출력
                        // 순서 : memoButton -> memoRoom (in this Widget , onPressed Function Run) -> memoContent print!
                        : memoButton()),
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            left: 20.0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 50.0,
              width: 100.0,
              decoration: (BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        offset: Offset(3, 3))
                  ])),
              child: const Center(
                child: PlugInText('memo',
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget memoButton() {
    return Consumer<RouteProvider>(
      builder: (context, routeProvider, child) => IconButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  MemoRoom(),
              opaque: false,
            ),
          );
        },
        icon: const Icon(CupertinoIcons.add, size: 30, color: Colors.black),
      ),
    );
  }

  Widget memoContent() {
    return Consumer<RouteProvider>(
      builder: (context, routeProvider, child) => Stack(
        children: <Widget>[
          Center(
            child: PlugInText(
              routeProvider.memoText,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15.0,
            ),
          ),
          Positioned(
            top: 100.0,
            left: 330.0,
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MemoRoom(),
                    opaque: false,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MemoRoom extends StatelessWidget {
  MemoRoom({Key? key}) : super(key: key);

  final _memoTextEditController = TextEditingController();

  get index => null;
  // 한줄 요약 : stl 과 provider 에 관계는 분업이다 . stl class 에서 ui 만 담당 , provider 에서는 동작 , 상태만 담당
  // 여기서 int clickCheckCount = 0 ; 은 stl class 에 묶여있으므로 상태 변화가 없음.
  // int clickCheckCount = 0;

  void dispose() {
    _memoTextEditController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // StatelessWidget , Provider -> 한마디로 분업 ,
    // StatelessWidget 은 사용자에게 눈으로 보여지는 UI를 담당.
    // Provider 는 사용자가 발생시킨 이벤트의 상태 , 동작을 담당.
    // Consumer 위젯을 통해서 분업된 2개의 작업을 한번에 수행 할수 있게 해줌.
    // ***** 주의 사항 : StatelessWidget 내에서는 상태변화가 일어날수 없음
    // ex) 숫자를 증가시키는 함수를 선언해도 작동하지 않음.
    return Consumer<RouteProvider>(
      builder: (context, routeProvider, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black.withOpacity(0.85),
        body: Center(
          // plugging date , title , content
          child: PlugInContainer(
            color: Colors.white,
            height: 200.0,
            useShadow: false,
            child: Stack(
              children: [
                const SizedBox(height: 10.0),
                // TODO : 텍스트 공간을 정해두고 글자수 맞춰주면 글자크기를 조절?
                // TODO : 글자수 제한 + 메모장 한줄 띄우기
                TextFormField(
                  controller: _memoTextEditController,
                  onChanged: (text) {},
                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      labelText: '    plugging memo',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: ' 메모를 입력하세요',
                      border: InputBorder.none),
                ),
                Positioned(
                  top: 150.0,
                  left: 330.0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.check,
                      size: 25,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      routeProvider.clickCheckCount += 1;
                      routeProvider.fillMemo(_memoTextEditController.text);
                      if (routeProvider.clickCheckCount == 1) {
                        routeProvider.insertData(_memoTextEditController.text);
                      } else {
                        routeProvider.updateData(_memoTextEditController.text);
                      }
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 메모장을 열어주는 함수 생성 + class , memo provider 생성 view model 로 연결
