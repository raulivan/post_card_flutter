import 'package:flutter/material.dart';
import 'package:post_card/src/data/item.dart';
import 'package:post_card/src/view/post_card.dart';

///Compoente de ira listar todas as postagem
///Com rolagem
class ListViewPostCard extends StatefulWidget {
  Future<List<ItemData>> handleGetDataSoource;

  ListViewPostCard(this.handleGetDataSoource);

  @override
  _ListViewPostCardState createState() => _ListViewPostCardState();
}

class _ListViewPostCardState extends State<ListViewPostCard> {
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemData>>(
        future: getDataSource(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Carregando as postagens...', style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 5,),
                  CircularProgressIndicator()
                ],
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return PostCard(context, snapshot.data[index]);
              },
            );
          }
        });
  }

  Future<List<ItemData>> getDataSource() {
    return this.widget.handleGetDataSoource;
  }
}
