import 'package:flutter/material.dart';
import 'package:post_card/src/data/item.dart';
import 'package:post_card/src/view/liste_view_post_card.dart';
import 'package:post_card/src/view/post_card.dart';

///Tela de apresentação de detalhes de uma postagem
///onde é apresentando os comentarios
class DetalhePostagemPage extends StatefulWidget {

  ItemData postagem;

  DetalhePostagemPage(this.postagem);

  @override
  _DetalhePostagemPageState createState() => _DetalhePostagemPageState();
}

class _DetalhePostagemPageState extends State<DetalhePostagemPage> {

  Future<List<ItemData>> getFutureDados() async =>
      await Future.delayed(Duration(seconds: 1), () {
        return this.widget.postagem.getComentarios();
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Comentários')),
      body: Column(
        children: <Widget>[
          PostCard(context, this.widget.postagem),
          Expanded(child: ListViewPostCard(getFutureDados()))
          
        ],
      ),
    );
  }
}