import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kelime_app/colorMethod.dart';
import 'package:kelime_app/pages/listPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Lang { eng, tr }

class _HomePageState extends State<HomePage> {
  Lang? _chooseLang = Lang.eng;

  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); //ana ekrandaki drawer için

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, //ana ekrandaki drawer için
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        color: Colors.white,
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading:
              false, //flutter yada appBar ile gelen şeyleri otomatik önler
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: InkWell(
                      //buton olmasını istediğimiz şeyleri sarmak için kullanıyoruz.
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: FaIcon(
                        FontAwesomeIcons.bars,
                        color: Colors.black,
                        size: 20,
                      ))),
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text("deneme")),
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                LangRadioButton(
                    text: "Türkçe - İngilizce",
                    group: _chooseLang,
                    Value: Lang.tr),
                LangRadioButton(
                    text: "İngilizce - Türkçe",
                    group: _chooseLang,
                    Value: Lang.eng),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListPage(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    margin: EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(ColorMethod.HexaColorConverter("#7020A6")),
                          Color(ColorMethod.HexaColorConverter("#C8A2C8")),
                        ],
                        tileMode: TileMode.repeated,
                      ),
                    ),
                    child: Text(
                      "Listelerim",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: "mine",
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      card(
                          context, //BU KISMI EXTRAT METHOD İLE CARD A ÇEVİRİP DÜZENLEDİM KOD SADELEŞMİŞ OLDU
                          startColor: "#7020A6",
                          endColor: "#C8A2C8",
                          title: "Kelime\nKartlari"),
                      card(context,
                          startColor: "#7020A6",
                          endColor: "#C8A2C8",
                          title: "Coktan\nSecmeli"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container card(
      BuildContext context,
      {@required
          String?
              startColor, //BU YÖNTEM İLE EXTRAT METHOD EKLEYİP KODU SADELEŞTİRDİK VE BİRDEN FAZLA KULLANIM İÇİN OLDUKÇA KULLANIŞLI
      @required
          String? endColor,
      @required
          String? title}) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      width: MediaQuery.of(context).size.width * 0.37,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(ColorMethod.HexaColorConverter(startColor!)),
              Color(ColorMethod.HexaColorConverter(endColor!)),
            ],
            tileMode: TileMode.repeated,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title!,
            style: TextStyle(
                fontSize: 24, fontFamily: "mine", color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.file_copy_outlined,
            size: 32,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  SizedBox LangRadioButton(
      //BU YÖNTEM İLE EXTRAT METHOD EKLEYİP KODU SADELEŞTİRDİK VE BİRDEN FAZLA KULLANIM İÇİN OLDUKÇA KULLANIŞLI
      {@required String? text,
      @required Lang? Value,
      @required Lang? group}) {
    return SizedBox(
      width: 250,
      height: 30,
      child: ListTile(
        title: Text(
          text!,
          style: TextStyle(fontFamily: "mine", fontSize: 15),
        ),
        leading: Radio<Lang>(
          value: Lang.tr,
          groupValue: _chooseLang,
          onChanged: (Lang? value) {
            setState(() {
              _chooseLang = value;
            });
          },
        ),
      ),
    );
  }
}
