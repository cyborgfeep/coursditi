import 'package:coursditi/models/conso.dart';
import 'package:coursditi/models/feature.dart';
import 'package:coursditi/screens/camera_screen.dart';
import 'package:coursditi/screens/splash_screen.dart';
import 'package:coursditi/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/carousel/carousel_pro.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<Conso> consoList = [];
  bool showAmount = false;
  late ScrollController controller;
  bool isExpanded = true;
  bool isFaceActivated = false;
  late List<Widget> imageSliders = [];
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    super.initState();
    consoList.add(Conso(
      bg: primaryColor,
      title: "Orange Money",
      img: CupertinoIcons.money_dollar,
      details: "Voir détails",
      value: "5 000 Fcfa",
    ));
    consoList.add(Conso(
      bg: Colors.deepPurpleAccent,
      title: "Crédit Global",
      img: CupertinoIcons.phone_fill,
      details: "Valable jusqu'au 21/03/2024",
      value: "10 000 Fcfa",
    ));
    consoList.add(Conso(
      bg: Colors.green,
      title: "Points Sargal",
      img: CupertinoIcons.gift_fill,
      details: "Mise à jour le 31/03/2023",
      value: "322 ts",
    ));

    controller = ScrollController()
      ..addListener(() {
        setState(() {
          if (controller.hasClients &&
              controller.offset > (120 - kToolbarHeight)) {
            isExpanded = false;
          } else {
            isExpanded = true;
          }
        });
      });
    imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item)} image',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(color: primaryColor)),
                          height: 60,
                          width: 60,
                          child: Image.asset(
                            "assets/images/profile.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            scaffoldKey.currentState!.closeDrawer();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Icon(Icons.clear),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Sidy Konteye",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        print("Open Profile");
                      },
                      child: const Text(
                        "Editer mon compte",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Mes lignes",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            print("Open Profile");
                          },
                          child: const Text(
                            "Gérer mes lignes",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 120,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.green)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Icon(
                                      Icons.sim_card_outlined,
                                      size: 35,
                                    ),
                                    Radio(
                                      value: true,
                                      onChanged: (value) {},
                                      groupValue: null,
                                    )
                                  ],
                                ),
                                const Text(
                                  "77 777 77 77",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "Jamono New S'cool",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 200,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Sécurité",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/faceid.png",
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Face ID/Touch ID",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    canCheckBiometrics!
                                        ? "Activer/Désactiver FaceID"
                                        : "Oups ça ne marche pas",
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          canCheckBiometrics!
                              ? CupertinoSwitch(
                                  value: isFaceActivated,
                                  onChanged: (val) {
                                    setState(() {
                                      isFaceActivated = val;
                                    });
                                  })
                              : const SizedBox.shrink()
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            title: const Text(
              "77777777",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
            ),
            actions: [
              !isExpanded
                  ? const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(Icons.search, color: Colors.black),
                    )
                  : const SizedBox.shrink(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CameraScreen();
                        },
                      ));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.qr_code, color: Colors.black),
                ),
              )
            ],
            elevation: 0,
            expandedHeight: 120,
            pinned: true,
            floating: true,
            flexibleSpace: Container(
                margin: const EdgeInsets.only(top: 90),
                height: 100,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: const [
                    // Icon(Icons.search,color: Colors.grey,),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Que souhaitez-vous?",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  height: 70,
                  child: Row(
                    children: [
                      pubWidget(
                          img: "assets/images/om.png", title: "Orange Money"),
                      pubWidget(img: "assets/images/om.png", title: "Mobile"),
                      pubWidget(img: "assets/images/om.png", title: "Boutique"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Suivi conso",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {
                          print("voir details");
                        },
                        child: const Text(
                          "voir détails",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: primaryColor),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    itemCount: consoList.length,
                    itemBuilder: (context, index) {
                      Conso conso = consoList[index];
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            setState(() {
                              showAmount = !showAmount;
                            });
                          }
                        },
                        child: Container(
                          height: 80,
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              conso.bg!,
                              conso.bg!.withOpacity(0.5)
                            ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      conso.title!,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    index == 0 && !showAmount
                                        ? const SizedBox.shrink()
                                        : Text(
                                            conso.value!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 16),
                                          ),
                                    index == 0 && !showAmount
                                        ? Row(
                                            children: const [
                                              Text("Voir mon solde",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 13)),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios_sharp,
                                                size: 12,
                                                color: Colors.white,
                                              )
                                            ],
                                          )
                                        : InkWell(
                                            onTap: () {
                                              if (index == 0) {
                                                print("Voir details");
                                              }
                                            },
                                            child: Text(
                                              conso.details!,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10),
                                            ),
                                          ),
                                  ],
                                ),
                                index == 0 && showAmount
                                    ? Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: const Icon(
                                            Icons.visibility_rounded,
                                            size: 15,
                                            color: Colors.white),
                                      )
                                    : Icon(
                                        conso.img!,
                                        size: 35,
                                        color: Colors.white.withOpacity(0.5),
                                      )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: Feature.featureList.length,
                  itemBuilder: (context, index) {
                    Feature f = Feature.featureList[index];
                    return Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            f.img!,
                            width: 40,
                          ),
                          Text(f.title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 14)),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            f.desc!,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 100.0,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Carousel(
                      boxFit: BoxFit.cover,
                      dotColor: Colors.black,
                      dotSize: 7,
                      dotSpacing: 16.0,
                      dotPosition: DotPosition.bottomLeft,
                      dotIncreasedColor: Colors.white,
                      dotBgColor: Colors.transparent,
                      showIndicator: true,
                      overlayShadow: false,
                      overlayShadowColors: Colors.white.withOpacity(0.2),
                      overlayShadowSize: 0.9,
                      images: [
                        NetworkImage(imgList[0]),
                        NetworkImage(imgList[1]),
                        NetworkImage(imgList[2]),
                        NetworkImage(imgList[3]),
                      ],
                      onImageChange: (img, s) {},
                      onImageTap: (img) {},
                      radius: const Radius.circular(1.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget pubWidget({required String img, required String title}) {
    return SizedBox(
      height: 60,
      width: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              img,
              height: 35,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
