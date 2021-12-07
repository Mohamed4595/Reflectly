import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reflectly/screens/dailyQuotes/DailyQuotes.dart';
import 'package:reflectly/utils/MyTheme.dart';
import 'package:reflectly/utils/size_config.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).secondaryHeaderColor,
              ],
            ),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            DailyQuotes(),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              height: getProportionateScreenHeight(60),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, -1),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wb_sunny_outlined,
                              size: 25, color: MyTheme.titleColor),
                          Icon(
                            Icons.brightness_1_rounded,
                            size: 5,
                            color: MyTheme.titleColor,
                          ).marginOnly(top: 5),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.format_quote_outlined,
                              size: 25, color: MyTheme.subtitleColor),
                          Icon(
                            Icons.brightness_1_rounded,
                            size: 5,
                            color: Colors.transparent,
                          ).marginOnly(top: 5),
                        ],
                      ),
                      SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.auto_graph_rounded,
                              size: 25, color: MyTheme.subtitleColor),
                          Icon(
                            Icons.brightness_1_rounded,
                            size: 5,
                            color: Colors.transparent,
                          ).marginOnly(top: 5),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.content_copy_outlined,
                              size: 25, color: MyTheme.subtitleColor),
                          Icon(
                            Icons.brightness_1_rounded,
                            size: 5,
                            color: Colors.transparent,
                          ).marginOnly(top: 5),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 10,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: getProportionateScreenWidth(70),
                    width: getProportionateScreenWidth(70),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                       25
                      ),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigoAccent.withAlpha(100),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(Icons.add, size: 25, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
