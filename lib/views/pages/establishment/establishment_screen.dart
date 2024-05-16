import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:menu_digitale_tablette/helpers/providers/Auth.dart';
import 'package:menu_digitale_tablette/helpers/providers/Establishments.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/models/category_model.dart';
import 'package:menu_digitale_tablette/views/pages/home/home_screen.dart';
import 'package:menu_digitale_tablette/views/pages/plan_de_table/Table_welcome_screen.dart';
import 'package:menu_digitale_tablette/views/pages/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

class EstablishmentsScreen extends StatefulWidget {
  @override
  _EstablishmentsScreenState createState() => _EstablishmentsScreenState();
}

class _EstablishmentsScreenState extends State<EstablishmentsScreen> {
  @override
  Widget build(BuildContext context) {
    final Products prodProvider = Provider.of<Products>(context);
    final Establishments estabProvider = Provider.of<Establishments>(context);

    final Auth authProvider = Provider.of<Auth>(context);
    final CarouselController _controller = CarouselController();

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 82, 60, 95),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.9),
            image: DecorationImage(
              image: AssetImage("assets/images/login.png"),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(44, 44, 44, 0.694).withOpacity(0.8)),
              child: Column(
                children: [
                  SizedBox(height: 5.3125.h),
                  Row(
                    children: [
                      SizedBox(
                        width: 2.013888888888889.w,
                      ),
                      Container(
                        width: 8.61111111111111.w,
                        height: 6.145833333333333.h,
                        child: Image.asset(
                          "assets/images/foodeatupservice.png",
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 3.229166666666667.h,
                        width: 25.763888888888886.w,
                        child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Choissisez votre établissement",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 9.w),
                        child: Container(
                          width: 1.48125.w,
                          height: 3.221875.h,
                          child: FittedBox(
                              child: Icon(
                            Icons.search_outlined,
                            size: 40,
                            color: Colors.white,
                          )),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 6.5.h,
                    width: 93.125.w,

                    child: CarouselSlider(items: const [
                      Text("paul"),
                      Text("lescient"),
                      Text("lepaddock")
                    ], options: CarouselOptions()),
                  ),
                  SizedBox(
                    height: 1.9270833333333335.h,
                  ),
                  Divider(),
                  SizedBox(
                    height: 4.375.h,
                  ),
                  Container(
                    height: 3.229166666666667.h,
                    width: 25.763888888888886.w,
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Choissisez votre établissement",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                  SizedBox(
                    height: 4.583333333333333.h,
                  ),
                  Container(child:
                      Consumer<Establishments>(builder: (context, provider, _) {
                    return provider.establishments.isNotEmpty
                        ? Flexible(
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      ...Iterable<int>.generate(estabProvider
                                              .establishments.length)
                                          .map(
                                        (int pageIndex) => Flexible(
                                          child: ElevatedButton(
                                            onPressed: () => _controller
                                                .animateToPage(pageIndex),
                                            child: Text("$pageIndex"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 8.166666666666666.w,
                                          height: 6.25.h,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: OutlinedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                shape: MaterialStateProperty
                                                    .all<CircleBorder>(
                                                        CircleBorder()),
                                              ),
                                              onPressed: () =>
                                                  _controller.previousPage(),
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: Colors.white,
                                                size: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 83.29166666666667.w,
                                          child: CarouselSlider.builder(
                                            itemCount:
                                                provider.establishments.length,
                                            itemBuilder:
                                                (context, index, realIndex) {
                                              return GestureDetector(
                                                onTap: () async {
                                                  authProvider
                                                          .selectedestablishment =
                                                      provider.establishments[
                                                          index];
                                                  print(
                                                      'Establishment selected: ${provider.establishments[index].id}');
                                                  await prodProvider
                                                      .fetchcategoryAndProducts(
                                                          provider
                                                              .establishments[
                                                                  index]
                                                              .id);
                                                  if (prodProvider
                                                      .categories.isNotEmpty) {
                                                    print(
                                                        'Navigating to HomeScreen');
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            WelcomeScreen(),
                                                      ),
                                                    );
                                                  } else {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Tablewelcome(),
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width:
                                                          19.583333333333332.w,
                                                      height: 30.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    7.0)),
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 0.9),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    7.0)),
                                                        child: Image.network(
                                                          provider
                                                              .establishments[
                                                                  index]
                                                              .covImg,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            carouselController: _controller,
                                            options: CarouselOptions(
                                              height: 30.h,
                                              autoPlay: false,
                                              padEnds: true,
                                              enableInfiniteScroll: false,
                                              enlargeCenterPage: true,
                                              initialPage: ((provider
                                                          .establishments
                                                          .length /
                                                      2)
                                                  .toInt()),
                                              autoPlayAnimationDuration:
                                                  Duration(milliseconds: 800),
                                              viewportFraction: 0.28,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 8.166666666666666.w,
                                          height: 6.25.h,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: OutlinedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                shape: MaterialStateProperty
                                                    .all<CircleBorder>(
                                                        CircleBorder()),
                                              ),
                                              onPressed: () =>
                                                  _controller.nextPage(),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                                size: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
SizedBox(height: 2.7083333333333335.h,),
                                  Container(
                                    height:10.h,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Container(
                                        width: 18.291666666666668.w,
                                        child: Text("Lorem ipsum dolor sit amet consectetur. Bibendum nunc pellentesque in tincidunt tortor auctor tellus congue neque. "
                                        ,style: TextStyle(color: Colors.white,fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.208333333333334.h,),
                                  Container(
                                    height: 6.5625.h,
                                    width: 25.w,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Container(
                                        width: 7.083333333333333.w,
                                        height: 2.3958333333333335.h,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(
                                            'Connexion',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    238, 48, 65, 1),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24),
                                          ),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(246, 246, 246, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  })),
                ],
              ),
            ),
          )),
    );
  }
}
