import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plug_in/data/model/ranking_user_form.dart';

class RankingView extends StatelessWidget {
  const RankingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        rankingTop3(context),
        borderLine(),
        searchUser(),
        rankingUserUi(),
        rankingUserList()
      ],
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
                child: Image.asset('images/user1.png'),
                height: 120.0,
                width: 120.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
              ),
              const Text(
                'Top2',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                'distance',
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
                child: Image.asset('images/user2.png'),
                height: 150.0,
                width: 150.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffffd700)),
              ),
              const Text(
                'Top1',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                'distance',
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
                child: Image.asset('images/user3.png'),
                height: 110.0,
                width: 110.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.brown),
              ),
              const Text(
                'Top3',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                'distance',
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
              "user name or nickname",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0, top: 20.0),
          height: 50.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: const Center(
            child: Icon(Icons.search),
            // child: Text(
            //   "Search",
            //   style:
            //       TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            // ),
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
                'user name',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 88.5, right: 41.5),
              child: const Text(
                'distance',
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
                shape: BoxShape.circle, color: Colors.blueGrey),
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
    List<RankingUserForm> userList = [
      RankingUserForm(
          rankingNumber: 4,
          rankingUserImage: 'images/user4.png',
          ranKingUserName: 'tree',
          ploggingKm: 42.1),
      RankingUserForm(
          rankingNumber: 5,
          rankingUserImage: 'images/user5.png',
          ranKingUserName: 'juwon',
          ploggingKm: 40.3),
      RankingUserForm(
          rankingNumber: 6,
          rankingUserImage: 'images/user6.png',
          ranKingUserName: 'woong',
          ploggingKm: 38.2),
      RankingUserForm(
          rankingNumber: 7,
          rankingUserImage: 'images/user7.png',
          ranKingUserName: 'josh',
          ploggingKm: 35.9),
      RankingUserForm(
          rankingNumber: 8,
          rankingUserImage: 'images/user8.png',
          ranKingUserName: 'hodun',
          ploggingKm: 33.1),
      RankingUserForm(
          rankingNumber: 9,
          rankingUserImage: 'images/user9.png',
          ranKingUserName: 'heez',
          ploggingKm: 30.2),
      RankingUserForm(
          rankingNumber: 10,
          rankingUserImage: 'images/user10.png',
          ranKingUserName: 'nowyeon',
          ploggingKm: 27.7),
      RankingUserForm(
          rankingNumber: 11,
          rankingUserImage: 'images/user11.png',
          ranKingUserName: 'sun',
          ploggingKm: 23.2),
      RankingUserForm(
          rankingNumber: 12,
          rankingUserImage: 'images/user12.png',
          ranKingUserName: 'jjung',
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
