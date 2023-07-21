
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Card.dart';
import 'Checkout.dart';

class Appbar extends StatelessWidget {
    const Appbar({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      final Carddd =Provider.of<Cardd>(context);
      return Row(
        children: [

          Stack(
              children:[
                Container(

                  child: Text( '${Carddd.selectedproducts.length}'
                      ,style: TextStyle(fontSize:12,color: Colors.amberAccent)),

                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle
                  ),
                ),




                IconButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder:
                      (Context)=>Checkout()));
                },

                  icon: Icon(Icons.add_shopping_cart),

                ),

              ] ),



          Text('\$${Carddd.price}'
              ,style: TextStyle(fontSize: 18,color: Colors.black)),

          IconButton(onPressed: (){},

              icon: Icon(Icons.person_search)

          ),
        ],


      );
    }
  }
