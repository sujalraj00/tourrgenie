import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourgenie/cubit/app_cubit_states.dart';
import 'package:tourgenie/cubit/app_cubits.dart';
import 'package:tourgenie/misc/colors.dart';
import 'package:tourgenie/screens/detail_page.dart';
import 'package:tourgenie/widgets/app_large_text.dart';
import 'package:tourgenie/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadingState) {
            //  var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 20),
                  child: Row(
                    children: [
                      Icon(Icons.menu, size: 30, color: Colors.black54),
                      Expanded(child: Container()),
                      Container(
                        padding: EdgeInsets.all(3.3),
                        margin: const EdgeInsets.only(right: 20),
                        width: 50,
                        height: 50,
                        //child: Image(image: AssetImage("img/boy.png")),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                                image: AssetImage("img/boy.png")),
                            color: Colors.grey.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Discover")),
                SizedBox(
                  height: 20,
                ),
                // tabbar
                Container(
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        tabAlignment: TabAlignment.start,
                        controller: _tabController,
                        labelColor: Colors.black,
                        dividerColor: Colors.transparent,
                        labelPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorPadding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(
                            color: AppColors.mainColor, radius: 4),
                        tabs: [
                          Tab(
                            text: "Places",
                          ),
                          Tab(
                            text: "Inspiration",
                          ),
                          Tab(
                            text: "Emotions",
                          )
                        ]),
                  ),
                ),
                Container(
                  height: 300,
                  padding: const EdgeInsets.only(left: 20),
                  width: double.maxFinite,
                  child: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                      itemCount: 3,
                      // itemcount : info.length
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<AppCubits>(context)
                            //     .detailPage(info[index]);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => DetailPage()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("img/mountain.jpeg"),
                                    // image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+info[index].img)
                                    fit: BoxFit.cover)),
                          ),
                        );
                      },
                    ),
                    Text('There'),
                    Text('Bye')
                  ]),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Explore more",
                        size: 22,
                      ),
                      AppText(
                        text: "See all",
                        color: AppColors.textColor1,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // margin: const EdgeInsets.only(right: 50),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage("img/" +
                                            images.keys.elementAt(index)),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: AppColors.textColor2,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
