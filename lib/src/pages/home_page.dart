import 'package:flutter/material.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pelicuals en Cine'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            _swiperTarjetas()
          ],
        ),
      )
    );
  }

  Widget _swiperTarjetas(){
    return CardSwiperWidget(
      peliculas: [1, 2, 3, 4, 5],
    );
  }
}