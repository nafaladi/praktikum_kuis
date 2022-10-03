import 'package:flutter/material.dart';
import 'books_detail.dart';
import 'books_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Buku"),
        ),
        body: GridView.builder(
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
            itemBuilder: (context, index) {
              final BooksData books = booksData[index];
              return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(books : books)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.orange
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(books.imageLinks, height: 130),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(books.title,
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              );
            }
        )
    );
  }
}
