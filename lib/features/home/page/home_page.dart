import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:luvit/app/src/core/utils/ui_helper.dart';
import 'package:luvit/app/src/theme/assets.dart';
import 'package:luvit/app/src/theme/colors.dart';
import 'package:luvit/app/src/theme/font.dart';
import 'package:luvit/features/home/widgets/carousel_slider_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final activeIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 11, 4, 11),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.location),
                  const Text.rich(
                    TextSpan(
                      text: '목이길어슬픈기린',
                      style: TextStyle(
                        fontFamily: Fonts.pretendard,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '님의 새로운',
                          style: TextStyle(
                            fontFamily: Fonts.pretendard,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: ' 스팟',
                          style: TextStyle(
                            fontFamily: Fonts.pretendard,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: LuvitColors.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.star),
                        const Gap(2),
                        const Text(
                          '323,233',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: LuvitColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(Assets.notification),
                ],
              ),
            ),
            const Expanded(
              child: CarouselSliderWidget(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(Assets.bottomNav2),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: UiHelper(context).screenSize.width,
              child: ValueListenableBuilder(
                valueListenable: activeIndex,
                builder: (context, index, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      item(
                        image: Assets.home,
                        text: '홈',
                        isActive: index == 1,
                        onTap: () {
                          activeIndex.value = 1;
                        },
                      ),
                      item(
                        image: Assets.location2,
                        text: '스팟',
                        isActive: index == 2,
                        onTap: () {
                          activeIndex.value = 2;
                        },
                      ),
                      item(
                        image: Assets.starCircle,
                        padding: const EdgeInsets.only(
                          bottom: 30,
                        ),
                        isActive: index == 3,
                        onTap: () {
                          activeIndex.value = 3;
                        },
                      ),
                      item(
                        image: Assets.message,
                        text: '채팅',
                        isActive: index == 4,
                        onTap: () {
                          activeIndex.value = 4;
                        },
                      ),
                      item(
                        image: Assets.person,
                        text: '마이',
                        isActive: index == 5,
                        onTap: () {
                          activeIndex.value = 5;
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget item({
    required String image,
    bool isActive = false,
    String? text,
    EdgeInsets? padding,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 20),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset(
              image,
              // colorFilter: ColorFilter.mode(
              //   isActive ? const Color(0xffFF016B) : const Color(0xff3A3A3A),
              //   BlendMode.srcIn,
              // ),
            ),
            const Gap(4),
            if (text != null)
              Text(
                text,
                style: TextStyle(
                  fontFamily: Fonts.pretendard,
                  fontSize: 12,
                  color: isActive ? const Color(0xffFF016B) : const Color(0xff3A3A3A),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
