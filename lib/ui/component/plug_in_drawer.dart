import 'package:flutter/material.dart';
import 'package:plug_in/provider/member_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/util_provider.dart';

class PlugInDrawer extends StatelessWidget {
  const PlugInDrawer({Key? key}) : super(key: key);

  final BorderRadius _roundBorderRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(50.0),
    bottomRight: Radius.circular(50.0),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberProvider>(
      builder: (context, memberProvider, child) => Consumer<UtilProvider>(
        builder: (context, utilProvider, child) => Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      margin: EdgeInsets.zero,
                      currentAccountPicture: CircleAvatar(
                        child: Text(
                          "🥰",
                          style: TextStyle(fontSize: 45.0),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      accountName: Text(memberProvider.member.name),
                      accountEmail: Text(memberProvider.member.email),
                      decoration: BoxDecoration(
                        color: utilProvider.themeColor,
                      ),
                      onDetailsPressed: () {
                        utilProvider.toggleDetailButton();
                      },
                    ),
                    utilProvider.canSeeDetail
                        ? Container(
                            height: 40.0,
                            child: Center(
                              child: Text(
                                "백도훈의 프로필입니다.",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: utilProvider.themeColor,
                              borderRadius: _roundBorderRadius,
                            ),
                          )
                        : const SizedBox(
                            height: 0.0,
                          ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: utilProvider.drawerList.length,
                      itemBuilder: (context, index) => ListTile(
                        selected: ModalRoute.of(context)?.settings.name ==
                            utilProvider.drawerList[index].pageRoute,
                        selectedColor: Colors.lightGreen,
                        leading: utilProvider.drawerList[index].icon,
                        title: Text(utilProvider.drawerList[index].title),
                        onTap: () {
                          utilProvider.changeSelectIndex(index);
                          Navigator.pushNamed(context,
                              utilProvider.drawerList[index].pageRoute);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Row(
                  children: [
                    Flexible(
                      child: ListTile(),
                    ),
                    Flexible(
                      child: ListTile(
                        leading: Icon(Icons.logout_outlined),
                        title: Text("Logout"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
