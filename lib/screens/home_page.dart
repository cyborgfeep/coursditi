import 'package:coursditi/models/conso.dart';
import 'package:coursditi/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Conso> consoList = [];
  bool showAmount = false;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "77777777",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu_rounded,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.qr_code, color: Colors.black),
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade300,
            height: 70,
            child: Row(
              children: [
                pubWidget(img: "assets/images/om.png", title: "Orange Money"),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                      gradient: LinearGradient(
                          colors: [conso.bg!, conso.bg!.withOpacity(0.5)]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                conso.title!,
                                style: const TextStyle(color: Colors.white),
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
                                                fontWeight: FontWeight.w600,
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
                                      color: Colors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Icon(Icons.visibility_rounded,
                                      size: 15, color: Colors.white),
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
            padding: EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Image.asset("assets/images/om.png",width: 40,),
                    const Text("Acheter",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 14)),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "Credit, pass",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              );
            },
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
