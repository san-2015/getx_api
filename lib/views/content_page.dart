import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data_controller.dart';
import '../routes/route_name.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  void loadingData(DataController controller) {
    Future.delayed(Duration(seconds: 2), () {
      print("we are waiting for 2 seconds");
      controller.isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DataController _controller = Get.put(DataController());
    print(" _Conttrolller loading valie is1 ${_controller.isloading}");
    loadingData(_controller);
    // _controller.isloading = false;
    print(" _Conttrolller loading valie is2 ${_controller.isloading}");

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;
    return Obx(() => _controller.isloading == true
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            appBar: AppBar(
              // leading: IconButton(
              //     onPressed: () {
              //       Get.back();
              //     },
              //     icon: Icon(Icons.arrow_back_ios)),
              backgroundColor: const Color(0xFFc5e5f3),
            ),
            body: Container(
              padding: const EdgeInsets.only(top: 10),
              color: const Color(0xFFc5e5f3),
              child: Column(
                children: [
                  //james smith
                  Container(
                    width: width,
                    height: 100,
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFebf8fd),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("img/background.jpg"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_controller.dataList[1].name}",
                                style: TextStyle(
                                    color: Color(0xFF3b3f42),
                                    fontSize: 18,
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Top Level",
                                style: TextStyle(
                                    color: Color(0xFFfdebb2),
                                    fontSize: 12,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFf3fafc)),
                            child: const Center(
                              child: Icon(
                                Icons.notifications,
                                color: Color(0xFF69c5df),
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //popular contest
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        const Text(
                          "Popular Contest",
                          style: TextStyle(
                              color: Color(0xFF1f2326),
                              fontSize: 20,
                              decoration: TextDecoration.none),
                        ),
                        Expanded(child: Container()),
                        const Text(
                          "Show all",
                          style: TextStyle(
                              color: Color(0xFFcfd5b3),
                              fontSize: 15,
                              decoration: TextDecoration.none),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFfdc33c)),
                          child: GestureDetector(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //list
                  Container(
                    height: 220,
                    child: PageView.builder(
                        controller: PageController(viewportFraction: 0.88),
                        itemCount: _controller.dataList.length,
                        itemBuilder: (_, i) {
                          return GestureDetector(
                            onTap: () {
                              print("tapped index $i");

                              Get.toNamed(RouteName.getDetailPage(i),
                                  arguments: _controller.dataList[i]);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              height: 220,
                              width: MediaQuery.of(context).size.width - 20,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: i.isEven
                                      ? const Color(0xFF69c5df)
                                      : const Color(0xFF9294cc)),
                              child: Column(
                                children: [
                                  Container(
                                      child: Row(
                                    children: [
                                      Text(
                                        "${_controller.dataList[i].title}",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Expanded(child: Container())
                                    ],
                                  )),
                                  const SizedBox(height: 10),
                                  Container(
                                    width: width,
                                    child: Text(
                                      "${_controller.dataList[i].text}",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    thickness: 1.0,
                                  ),
                                  Row(children: [
                                    for (int i = 0; i < 1; i++)
                                      Container(
                                        width: 50,
                                        height: 50,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    "${_controller.dataList[i].img}",
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                      )
                                  ]),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //recent contests
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        const Text(
                          "Recent Contests",
                          style: TextStyle(
                              color: Color(0xFF1f2326),
                              fontSize: 20,
                              decoration: TextDecoration.none),
                        ),
                        Expanded(child: Container()),
                        const Text(
                          "Show all",
                          style: TextStyle(
                              color: Color(0xFFcfd5b3),
                              fontSize: 15,
                              decoration: TextDecoration.none),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFfdc33c)),
                          child: GestureDetector(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: _controller.dataList.length,
                              itemBuilder: (_, i) {
                                return GestureDetector(
                                  onTap: () {
                                    _controller.updateTempList(i);
                                    Get.toNamed(RouteName.getDetailPage(i),
                                        arguments: _controller.dataList[i]);
                                  },
                                  child: Container(
                                    width: width,
                                    height: 100,
                                    margin: const EdgeInsets.only(
                                        left: 25, right: 25, bottom: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFebf8fd),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundImage: AssetImage(
                                              "${_controller.dataList[i].img}",
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Text(
                                              //   "Status",
                                              //   style: TextStyle(
                                              //       // color: Color(0xFFfdebb2),
                                              //       color: Colors.red,
                                              //       fontSize: 12,
                                              //       decoration: TextDecoration.none),
                                              // ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                width: 170,
                                                child: Text(
                                                  "${_controller.dataList[i].name}",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Color(0xFF3b3f42),
                                                      fontSize: 18,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              )
                                            ],
                                          ),
                                          Expanded(child: Container()),
                                          Container(
                                            width: 38,
                                            height: 70,
                                            child: Text(
                                              "${_controller.dataList[i].time}",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Color(0xFFb2b8bb)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }))),
                ],
              ),
            ),
          ));
  }
}
