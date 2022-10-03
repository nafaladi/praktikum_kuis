import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'books_data.dart';


class Detail extends StatefulWidget {
  final BooksData books;

  const Detail({Key? key, required this.books}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Detail> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.books.title}"),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                icon:
                toggle ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
              ),
            ),
          ],
        ),

        body: Container(
          padding: EdgeInsets.all(12),
          //child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height) / 3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Image.network(widget.books.imageLinks, height: 400,),
                      );
                    },
                    itemCount: 1,
                  ),
                ),
                Container(
                  child: Text(
                    "Judul : ${widget.books.title}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
                Text(
                  "Penulis : ${widget.books.authors[0]}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "Penerbit : ${widget.books.publisher}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "Tanggal Rilis: ${widget.books.publishedDate}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "Kategori  : ${widget.books.categories[0]}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.orange.shade700,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Text(
                      "${widget.books.description}",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: (){
                    _launchURL(widget.books.previewLink);
                  }, // Respon ketika button ditekan
                  child: Text("Preview Buku"),
                )
              ],
            ),
          ),
        )
    );
  }
  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
