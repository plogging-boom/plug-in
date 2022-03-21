import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plug_in/plug_in_bottom_navigation_bar.dart';
import 'package:plug_in/rankingUserForm.dart';

class PluggingRanking extends StatelessWidget {
  const PluggingRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            rankingTop3(context),
            borderLine(),
            searchUser(),
            rankingUserUi(),
            rankingUserList()
          ],
        ),
      ),
      bottomNavigationBar: const PlugInBottomNavigationBar(),
    );
  }

  Widget rankingTop3(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 70.0),
                child: Image.asset('images/user1.jpg'),
                height: 120.0,
                width: 120.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
              ),
              const Text(
                'Top2',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                '플로깅 거리',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                '48.9 Km',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset('images/user2.jpg'),
                height: 150.0,
                width: 150.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
              ),
              const Text(
                'Top1',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                '플로깅 거리',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                '52.4 Km',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 100.0),
                child: Image.asset('images/user3.jpg'),
                height: 110.0,
                width: 110.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
              ),
              const Text(
                'Top3',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                '플로깅 거리',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                '44.7 Km',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget borderLine() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      height: 1,
      color: Colors.black,
      width: double.maxFinite,
    );
  }

  Widget searchUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20.0),
          height: 50.0,
          width: 250.0,
          decoration:
              BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
          child: const Center(
            child: Text(
              "사용자 이름 또는 아이디로 검색해보세요!",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0, top: 20.0),
          height: 75.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: const Center(
            child: Text(
              "랭킹검색",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  Widget rankingUserUi() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                '사용자 명',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 88.5, right: 41.5),
              child: const Text(
                '플로깅 거리',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  Widget rankingUserForm(int rankingNumber, String rankingUserImage,
      String rankingUserName, double ploggingKm) {
    return Row(
      children: [
        Container(
          width: 50,
          child: Center(
            child: Text(
              rankingNumber.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Image.asset(rankingUserImage),
            height: 50.0,
            width: 50.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            child: Center(
              child: Text(
                rankingUserName,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            child: Center(
              child: Text(
                ploggingKm.toString() + 'Km',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget rankingUserList() {
    List<RanKingUserInform> userList = [
      RanKingUserInform(
          rankingNumber: 4,
          rankingUserImage: 'images/user4.jpg',
          ranKingUserName: 'user1',
          ploggingKm: 42.1),
      RanKingUserInform(
          rankingNumber: 5,
          rankingUserImage: 'images/user5.jpg',
          ranKingUserName: 'user2',
          ploggingKm: 40.3),
      RanKingUserInform(
          rankingNumber: 6,
          rankingUserImage: 'images/user6.jpg',
          ranKingUserName: 'user3',
          ploggingKm: 38.2),
      RanKingUserInform(
          rankingNumber: 7,
          rankingUserImage: 'images/user7.jpg',
          ranKingUserName: 'user4',
          ploggingKm: 35.9),
      RanKingUserInform(
          rankingNumber: 8,
          rankingUserImage: 'images/user8.jpg',
          ranKingUserName: 'user5',
          ploggingKm: 33.1),
      RanKingUserInform(
          rankingNumber: 9,
          rankingUserImage: 'images/user9.jpg',
          ranKingUserName: 'user6',
          ploggingKm: 30.2),
      RanKingUserInform(
          rankingNumber: 10,
          rankingUserImage: 'images/user10.jpg',
          ranKingUserName: 'user7',
          ploggingKm: 27.7),
      RanKingUserInform(
          rankingNumber: 11,
          rankingUserImage: 'images/user11.jpg',
          ranKingUserName: 'user8',
          ploggingKm: 23.2),
      RanKingUserInform(
          rankingNumber: 12,
          rankingUserImage: 'images/user12.jpg',
          ranKingUserName: 'user9',
          ploggingKm: 19.8)
    ];
    return Expanded(
      child: ListView.builder(
        itemCount: userList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return rankingUserForm(
              userList[index].rankingNumber,
              userList[index].rankingUserImage,
              userList[index].ranKingUserName,
              userList[index].ploggingKm);
        },
      ),
    );
  }
}
