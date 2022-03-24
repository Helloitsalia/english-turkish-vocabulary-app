import 'package:flutter/material.dart';
import 'package:kelime_app/colorMethod.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 22,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple.withOpacity(0.3),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                child: Card(
                  color: Color(ColorMethod.HexaColorConverter("#DCD2FF")),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Liste adı",
                          style: TextStyle(color: Colors.black, fontSize: 16, fontFamily:"robotoM"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Text(
                          "305 terim",
                          style: TextStyle(color: Colors.black, fontSize: 16,fontFamily:"robotoR"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Text(
                          "5 öğrenildi",
                          style: TextStyle(color: Colors.black, fontSize: 16,fontFamily:"robotoR"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, bottom: 5),
                        child: Text(
                          "300 öğrenilmedi",
                          style: TextStyle(color: Colors.black, fontSize: 16,fontFamily:"robotoR"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
