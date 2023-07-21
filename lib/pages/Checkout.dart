
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Card.dart';
import 'appbar.dart';

   class Checkout extends StatelessWidget {
     const Checkout({Key? key}) : super(key: key);

     @override
     Widget build(BuildContext context) {
       final Carddd =Provider.of<Cardd>(context);
       return Scaffold(
         appBar: AppBar(
           actions: [
             Appbar()
           ],
           title: Text('checkout'),
           backgroundColor: Colors.orangeAccent,
         ),
         body:
     Column(
           children:[

             SingleChildScrollView(
             child: SizedBox(
               height: 500,
               child:ListView.builder(
       itemCount:Carddd.selectedproducts.length,



       itemBuilder: (BuildContext, int index){
       return Card(
       child: ListTile(
       subtitle: Text("TEST"),
       leading: CircleAvatar(backgroundImage:AssetImage
             (Carddd.selectedproducts[index].imagepath),),
       title: Text("TEST"),
       trailing: IconButton(
       onPressed: () { 
         
         Carddd.delete(Carddd.selectedproducts[index]);
       },
       icon: Icon(Icons.remove)),
       ),


        );


      }

       )
             ),
           ),

             ElevatedButton.icon(
               onPressed: (){},
               icon: Icon(Icons.edit_location, color: Color.fromARGB(255, 255, 129, 129), size: 24.0, ),
               label: Text("pay \$ ${Carddd.price}", style: TextStyle(fontSize: 19),),
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Color.fromARGB(146, 90, 104, 223)),
                 padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                 shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
               ),),

       ] )
       )    ;
     }
   }
