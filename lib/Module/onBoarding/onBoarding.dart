import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:twasol/Module/login/social_login_screen.dart';
import 'package:twasol/Module/register/register_screen.dart';
import 'package:twasol/model/boarding_model.dart';
import 'package:twasol/shared/components/components.dart';
import 'package:twasol/shared/network/local/cache_helper.dart';
import 'package:twasol/shared/styles/colors.dart';

import '../start_screen/start_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boardingList = [
    BoardingModel(
      image: 'assets/images/onb1.png',
      title: 'Communicate with People',
      body: 'Communicate with People ',
    ),
    BoardingModel(
      image: 'assets/images/negotiation.png',
      title: 'Chat With Your Friend',
      body: 'Chat With Your Friend',
    ),
    BoardingModel(
      image: 'assets/images/onb3.png',
      title: 'Post Your Daily in Twasol',
      body: 'Post Your Daily in Twasol',
    ),
  ];

  var boardingController = PageController();

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        NavigateAndFinish(
          context,
          const SocialLoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: const Text(
              'SKIP',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              itemBuilder: (context, index) =>
                  buildBoardingItem(boardingList[index]),
              controller: boardingController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == boardingList.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              itemCount: boardingList.length,
            )),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.white,
                    activeDotColor: Colors.deepOrange,
                    dotWidth: 10,
                    dotHeight: 10,
                    expansionFactor: 4,
                    spacing: 5,
                  ),
                  count: boardingList.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    if (isLast == true) {
                      submit();
                    } else {
                      boardingController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastOutSlowIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBoardingItem(BoardingModel model) => Container(
      height: 100.0,
      color: Colors.indigo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image!),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Text(
            model.title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            model.body!,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
