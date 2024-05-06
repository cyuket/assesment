import 'package:carousel_slider/carousel_slider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:luvit/app/src/core/utils/ui_helper.dart';
import 'package:luvit/app/src/theme/assets.dart';
import 'package:luvit/app/src/theme/colors.dart';
import 'package:luvit/app/src/theme/font.dart';
import 'package:luvit/features/home/widgets/scroller_index_container.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final carouselController = CarouselController();
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final uiHelper = UiHelper(context);
    final profiles = [
      const CarouselModel(
        image: Assets.profile01,
        description: '서울 · 2km 거리에 있음',
        age: '25',
        digits: '29,930',
        name: '잭과분홍콩나물',
      ),
      const CarouselModel(
        image: Assets.profile02,
        description: '서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다',
        age: '25',
        digits: '29,930',
        name: '잭과분홍콩나물',
      ),
      const CarouselModel(
        image: Assets.profile01,
        description: '서울 · 2km 거리에 있음',
        age: '25',
        digits: '29,930',
        name: '잭과분홍콩나물',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (context, currentIndex, _) {
          return SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  child: CarouselSlider.builder(
                    itemCount: profiles.length,
                    itemBuilder: (context, itemIndex, pageViewIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xff3A3A3A),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  profiles[itemIndex].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Image.asset(
                              Assets.rectangle,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: SizedBox(
                                height: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 40),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IntrinsicWidth(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                            top: 5,
                                            right: 6,
                                            bottom: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: Colors.black,
                                          ),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(Assets.blackStar),
                                              const Gap(2),
                                              Text(
                                                profiles[itemIndex].digits,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: LuvitColors.textColor,
                                                  fontFamily: Fonts.pretendard,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Gap(4),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        profiles[itemIndex].name,
                                                        style: const TextStyle(
                                                          fontFamily: Fonts.pretendard,
                                                          color: LuvitColors.textColor,
                                                          fontSize: 25,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                        softWrap: true,
                                                        overflow: TextOverflow.fade,
                                                      ),
                                                    ),
                                                    const Gap(4),
                                                    Text(
                                                      profiles[itemIndex].age,
                                                      style: const TextStyle(
                                                        fontFamily: Fonts.pretendard,
                                                        color: LuvitColors.textColor,
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                      softWrap: true,
                                                    ),
                                                  ],
                                                ),
                                                const Gap(2),
                                                Text(
                                                  profiles[itemIndex].description,
                                                  style: const TextStyle(
                                                    fontFamily: Fonts.pretendard,
                                                    color: LuvitColors.textColor,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SvgPicture.asset(Assets.purpleHeart),
                                        ],
                                      ),
                                      const Gap(10),
                                      const Align(
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: LuvitColors.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      carouselController.previousPage();
                                      if (currentIndex != 0) {
                                        _currentIndex.value -= 1;
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      carouselController.nextPage();
                                      if (currentIndex < 2) {
                                        _currentIndex.value += 1;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    disableGesture: true,
                    options: CarouselOptions(
                      height: uiHelper.screenSize.height / 1.2,
                      enableInfiniteScroll: false,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                    ),
                    carouselController: carouselController,
                  ),
                ),
                SizedBox(
                  width: uiHelper.screenSize.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      right: 60,
                      left: 60,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        profiles.length,
                        (index) => ScrollerIndexContainer(
                          isActive: currentIndex == index,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CarouselModel extends Equatable {
  const CarouselModel({
    required this.image,
    required this.description,
    required this.digits,
    required this.name,
    required this.age,
  });

  final String image;
  final String digits;
  final String name;
  final String age;
  final String description;

  @override
  List<Object> get props => [image, digits, name, age, description];
}
