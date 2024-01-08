import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: SafeArea(
          child: ClipRRect(
            
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Drawer(
                  backgroundColor: Colors.white,
                  child:  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: GestureDetector(
                              onTap: () {
                         
                              },
                              child: SizedBox(
                                height: 172,
                                child: Stack(
                                  children: [
                                    Material(
                                      elevation: 10,
                                      color: Colors.black,
                                      shape: const CircleBorder(),
                                      child: Container(
                                        height: 170,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 5),
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                            image: const DecorationImage(
                                                fit: BoxFit.fitHeight,
                                                image: AssetImage(
                                                    "assets/admin.JPG"))),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      right: 85,
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.blue[800],
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.grey[200],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Ajay Dev",
                            style: GoogleFonts.laila(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Owner Of This App.",
                            style: GoogleFonts.laila(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                        ]),
                        
                      ],
                    ),
                  ),
             
              ),
        ),
            
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text('Tic Tac Toe Game'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.help)),
            )
          ],
        ),
        body: Obx(() => Center(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Turn is ▼",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: controller.isActiveTurn.value
                              ? const Icon(Icons.question_mark)
                              : Row(children: [
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: controller.oTurn.value
                                            ? null
                                            : Colors.grey[300],
                                        alignment: Alignment.center,
                                        child: Text(
                                          "X",
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: controller.oTurn.value
                                                ? Colors.grey[300]
                                                : null,
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: controller.oTurn.value
                                            ? Colors.grey[300]
                                            : null,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "O",
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: controller.oTurn.value
                                                ? null
                                                : Colors.grey[300],
                                          ),
                                        ),
                                      ))
                                ])),
                      const SizedBox(height: 20),
                      SizedBox(
                          height: 320,
                  
                          child: GridView.builder(
                              itemCount: 9,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {
                                      controller.tapped(index);
                                      if (controller.winnerFound.value ==
                                        1 || controller.winnerFound.value ==
                                        2|| controller.winnerFound.value ==
                                        3) {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 200,
                                              alignment: Alignment.topCenter,
                                              decoration: const BoxDecoration(
                                                  color: Colors.black87,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20))),
                                              child:  Column(
                                                children: [
                                                  const SizedBox(height: 20),
                                                   Text(
                                                   controller.winnerFound.value == 3 ? "✨ Well Played ✨" : "✨ Congratulation's Bro ✨",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Text(
                                                   controller.winnerFound.value == 1 ? "🎉Winner is 'X'🎉" : controller.winnerFound.value == 2  ? "🎉Winner is 'O'🎉" : controller.winnerFound.value == 3 ? "Match is Draw" :  "Error"    ,
                                                    style: const TextStyle(
                                                        fontSize: 33,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 20),
                                                    Text(
                                                   controller.winnerFound.value == 3 ? "Try Agin....": "Dear ${controller.winnerFound.value == 1 ? "'O'" : controller.winnerFound.value == 2 ? "'X'" :""} I Know It's heartbreaking.\n Please Don't Suicide.Try Again....",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            width: 5,
                                            color: Colors.white,
                                          ),
                                          color:  controller.colorList[index],
                                        ),
                                        child: Center(
                                            child: Text(
                                                controller.displayXO[index],
                                                style:   TextStyle(
                                            color: controller.colorList[index] ==  Colors.black ? Colors.white: Colors.black ,
                                                    fontSize: 60,
                                                    fontWeight:
                                                        FontWeight.bold)))));
                              })),
                      const SizedBox(height: 20),
                      GestureDetector(
                          onTap: () {
                            controller.restartButton();
                          },
                          child: Container(
                              height: 50,
                              width: 150,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: const Text("Restart Game",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)))),
                     
                    ])))));
  }
}
