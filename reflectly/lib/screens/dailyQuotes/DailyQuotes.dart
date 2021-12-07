import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:reflectly/data/models/DailyQuotesModel.dart';
import 'package:reflectly/screens/dailyQuotes/DailyQuotesProvider.dart';
import 'package:reflectly/screens/dailyQuotes/LogoAnimationProvider.dart';
import 'package:reflectly/utils/CurveClipper.dart';
import 'package:reflectly/utils/MyImages.dart';
import 'package:reflectly/utils/MyTheme.dart';
import 'package:reflectly/utils/size_config.dart';

class DailyQuotes extends StatefulWidget {
  @override
  _DailyQuotesState createState() => _DailyQuotesState();
}

class _DailyQuotesState extends State<DailyQuotes> {
  DailyQuotesProvider dailyQuotesProvider = DailyQuotesProvider();

  LogoAnimationProvider logoAnimationProvider = LogoAnimationProvider();

  ScrollController _scrollController = ScrollController();

  PageController _pageViewController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    dailyQuotesProvider.getDailyQuotes();
    logoAnimationProvider.getCurrentAnimationState();
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  _animateToIndex(i) => _scrollController.animateTo((60 * i).toDouble(),
      duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: [
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
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
                      height: getProportionateScreenHeight(420),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChangeNotifierProvider.value(
                          value: logoAnimationProvider,
                          builder: (context, _) {
                            return Consumer<LogoAnimationProvider>(
                                builder: (context, provider, widget) {
                              provider.getCurrentAnimationState();
                              return appLogo();
                            });
                          }),
                      ChangeNotifierProvider.value(
                          value: dailyQuotesProvider,
                          builder: (context, _) {
                            return Consumer<DailyQuotesProvider>(
                                builder: (context, provider, widget) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider
                                        .dailyQuotesList[provider.currentIndex]
                                        .fullDayName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: Colors.white),
                                  ).marginOnly(
                                    top: getProportionateScreenWidth(10),
                                    left: getProportionateScreenWidth(20),
                                    right: getProportionateScreenWidth(20),
                                  ),
                                  Text(
                                    provider
                                        .dailyQuotesList[provider.currentIndex]
                                        .fullDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Colors.indigo),
                                  ).marginSymmetric(
                                    horizontal: getProportionateScreenWidth(20),
                                  ),
                                  weekDaysList(),
                                  Container(
                                    height: getProportionateScreenHeight(600),
                                    child: PageView(
                                      controller: _pageViewController,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (int index) {
                                        _animateToIndex(index);
                                        dailyQuotesProvider
                                            .setCurrentIndex(index);
                                      },
                                      children: dailyQuotesProvider
                                          .dailyQuotesList
                                          .map((pageView) =>
                                              pageViewItem(pageView))
                                          .toList(),
                                    ),
                                  ),
                                ],
                              );
                            });
                          }),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
  }

  Widget pageViewItem(DailyQuotesModel model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        dayCard(),
        quotCard(),
      ],
    );
  }

  Widget appLogo() {
    return Center(
      child: Container(
        height: getProportionateScreenWidth(70),
        width: getProportionateScreenWidth(70),
        child: Stack(
          children: [
            Image.asset(MyImages.appLogo,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.contain),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      logoAnimationProvider.currentAnimationState == 0 ||
                              logoAnimationProvider.currentAnimationState == 2
                          ? Icons.brightness_1_sharp
                          : Icons.remove_rounded,
                      color: MyTheme.black,
                      size: getProportionateScreenWidth(10)),
                  SizedBox(width: getProportionateScreenWidth(25)),
                  Icon(
                      logoAnimationProvider.currentAnimationState == 0 ||
                              logoAnimationProvider.currentAnimationState == 2
                          ? Icons.brightness_1_sharp
                          : Icons.remove_rounded,
                      color: MyTheme.black,
                      size: getProportionateScreenWidth(10)),
                ],
              ),
            )
          ],
        ),
      ).marginOnly(
        top: getProportionateScreenWidth(20),
      ),
    );
  }

  Widget weekDaysList() {
    return Container(
      height: getProportionateScreenHeight(70),
      child: ListView.builder(
          itemCount: dailyQuotesProvider.dailyQuotesList.length,
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          itemBuilder: (context, index) {
            return ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(getProportionateScreenWidth(10))),
                child: InkWell(
                  onTap: () {
                    _animateToIndex(index);
                    dailyQuotesProvider.setCurrentIndex(index);
                  },
                  child: Container(
                    color: dailyQuotesProvider.currentIndex == index
                        ? Colors.black12
                        : Colors.transparent,
                    width: getProportionateScreenWidth(50),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            dailyQuotesProvider
                                .dailyQuotesList[index].shortDayName,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            dailyQuotesProvider
                                .dailyQuotesList[index].dayNumber,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ).marginSymmetric(
                          horizontal: getProportionateScreenWidth(10)),
                    ),
                  ),
                )).marginSymmetric(
              horizontal: getProportionateScreenWidth(10),
            );
          }),
    ).marginOnly(top: getProportionateScreenWidth(20));
  }

  Widget dayCard() {
    return Container(
      height: getProportionateScreenHeight(250),
      child: Stack(
        children: [
          Card(
            child: Center(
              child: Column(
                children: [
                  Text(
                    dailyQuotesProvider
                        .dailyQuotesList[dailyQuotesProvider.currentIndex]
                        .quot
                        .title,
                    style: Theme.of(context).textTheme.headline6,
                  ).marginOnly(
                    top: getProportionateScreenWidth(40),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          dailyQuotesProvider
                              .dailyQuotesList[dailyQuotesProvider.currentIndex]
                              .quot
                              .subTitle,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: MyTheme.subtitleColor),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(getProportionateScreenWidth(10)),
                      ),
                      child: Container(
                        color: MyTheme.geryTransparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    dailyQuotesProvider
                                        .dailyQuotesList[
                                            dailyQuotesProvider.currentIndex]
                                        .quot
                                        .question,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: MyTheme.subtitleColor),
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_right_alt_rounded,
                                color: Theme.of(context).primaryColor)
                          ],
                        ).marginAll(getProportionateScreenWidth(5)),
                      ),
                    ).marginOnly(top: getProportionateScreenWidth(10)),
                  ),
                ],
              ).marginAll(getProportionateScreenWidth(10)),
            ),
          ).marginOnly(top: getProportionateScreenWidth(30)),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: getProportionateScreenWidth(60),
              width: getProportionateScreenWidth(60),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(60)),
                    side: BorderSide(color: Colors.transparent)),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(getProportionateScreenWidth(50))),
                  child: Image.network(
                    dailyQuotesProvider
                        .dailyQuotesList[dailyQuotesProvider.currentIndex]
                        .quot
                        .smallImageUrl,
                    height: getProportionateScreenWidth(50),
                    width: getProportionateScreenWidth(50),
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Align(
                        alignment: Alignment.center,
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(MyImages.appLogo,
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.contain)
                          .paddingAll(getProportionateScreenWidth(5));
                    },
                  ),
                ).marginAll(getProportionateScreenWidth(5)),
              ),
            ),
          )
        ],
      ),
    ).marginSymmetric(horizontal: getProportionateScreenWidth(20));
  }

  Widget quotCard() {
    return Container(
      height: getProportionateScreenHeight(250),
      child: Stack(
        children: [
          Card(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular(getProportionateScreenWidth(25))),
              child: Image.network(
                dailyQuotesProvider
                    .dailyQuotesList[dailyQuotesProvider.currentIndex]
                    .quot
                    .quotImageUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Align(
                    alignment: Alignment.center,
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(MyImages.appLogo,
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.contain)
                      .paddingAll(getProportionateScreenWidth(5));
                },
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(getProportionateScreenWidth(40))),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black12,
              child: Center(
                child: Text(
                  dailyQuotesProvider
                      .dailyQuotesList[dailyQuotesProvider.currentIndex]
                      .quot.quot,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.white),
                ).marginAll(getProportionateScreenWidth(20)),
              ),
            ).marginAll(getProportionateScreenWidth(5)),
          )
        ],
      ),
    ).marginOnly(
        top: getProportionateScreenWidth(20),
        left: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20));
  }
}
