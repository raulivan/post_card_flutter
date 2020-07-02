import 'package:flutter/material.dart';
import 'package:post_card/src/data/item.dart';
import 'package:post_card/src/view/liste_view_post_card.dart';

///Tela modelo de uso do componente
class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  ///Gerando postagens
  List<ItemData> montaListaPostagem() {
    var postagens = new List<ItemData>();

    for (var i = 1; i <= 10; i++) {
      var comentarios = new List<ItemData>();
      if(i % 2 == 0){
        var id = i + 1000;
        comentarios.add(ItemData(id,
          (i+1000),  
          'Comentario $i',
           'https://cdn.pixabay.com/photo/2012/04/13/21/07/user-33638_960_720.png',
            'Text do comentário', 
            DateTime.now(),i));

         comentarios.add(ItemData(id,
          (i+1000),  
          'Comentario $i',
           'https://cdn.pixabay.com/photo/2012/04/13/21/07/user-33638_960_720.png',
            'Outro texto de comentário, bala bla bla bla Lorem ipsum nam facilisis aenean nam lacus cursus ipsum, nulla sodales sed in rhoncus sapien odio litora, velit primis condimentum lobortis vulputate curabitur fringilla. condimentum laoreet ligula imperdiet cras aliquam vehicula suscipit aliquet in ultricies. Lorem ipsum nam facilisis aenean nam lacus cursus ipsum, nulla sodales sed in rhoncus sapien odio litora, velit primis condimentum lobortis vulputate curabitur fringilla. condimentum laoreet ligula imperdiet cras aliquam vehicula suscipit aliquet in ultricies. Lorem ipsum nam facilisis aenean nam lacus cursus ipsum, nulla sodales sed in rhoncus sapien odio litora, velit primis condimentum lobortis vulputate curabitur fringilla. condimentum laoreet ligula imperdiet cras aliquam vehicula suscipit aliquet in ultricies', 
            DateTime.now(),i));

          comentarios[1].addComentario(ItemData(id,
          (i+1000),  
          'Comentario de Comentário',
           'https://cdn.pixabay.com/photo/2012/04/13/21/07/user-33638_960_720.png',
            'Outro texto de comentário, bala bla bla bla Lorem ipsum nam facilisis aenean nam lacus cursus ipsum, nulla sodales sed in rhoncus sapien odio litora, velit primis condimentum lobortis vulputate curabitur fringilla. condimentum laoreet ligula imperdiet cras aliquam vehicula suscipit aliquet in ultricies. Lorem ipsum nam facilisis aenean nam lacus cursus ipsum, nulla sodales sed in rhoncus sapien odio litora, velit primis condimentum lobortis vulputate curabitur fringilla. condimentum laoreet ligula imperdiet cras aliquam vehicula suscipit aliquet in ultricies. Lorem ipsum nam facilisis aenean nam lacus cursus ipsum, nulla sodales sed in rhoncus sapien odio litora, velit primis condimentum lobortis vulputate curabitur fringilla. condimentum laoreet ligula imperdiet cras aliquam vehicula suscipit aliquet in ultricies', 
            DateTime.now(),i));
      }
      postagens.add(ItemData(
          i,
          (i + 100),
          'Apelido $i',
          'https://cdn.pixabay.com/photo/2012/04/13/21/07/user-33638_960_720.png',
          'Texto da postagem de exemplo $i. Lorem ipsum nam facilisis aenean nam lacus cursus ipsum, nulla sodales sed in rhoncus sapien odio litora, velit primis condimentum lobortis vulputate curabitur fringilla. condimentum laoreet ligula imperdiet cras aliquam vehicula suscipit aliquet in ultricies',
          DateTime.now(),0));
      
      postagens[(i-1)].addComentarios(comentarios);
    }
    return postagens;
  }

  ///Construindo um método Future, para vincular ao componente
  ///pois o componente espera os dados Futuros, 
  ///ideal para usar com Firebase e webservices
  Future<List<ItemData>> getFutureDados() async =>
      await Future.delayed(Duration(seconds: 5), () {
        return montaListaPostagem();
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tela de demonstração do Post Card'),
        ),
        ///Usando o componente ListViewPostCard, passando como parâmetro a fonte de dados
        body: ListViewPostCard(getFutureDados()));
  }
}
