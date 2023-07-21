import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Card.dart';
import 'Checkout.dart';
import 'Details screen.dart';
import 'Item.dart';
import 'appbar.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
   @override
   Widget build(BuildContext context) {
final Carddd =Provider.of<Cardd>(context);
    return SafeArea(
      child: Scaffold(

          drawer: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/samaa.jpg'),
                            fit: BoxFit.cover
                      )
                    ),

                    accountName: Text('Saad Attallah',style: TextStyle(fontSize: 18),),
                    accountEmail: Text('Saad@yahoo.com',style: TextStyle(fontSize: 18),),
                  currentAccountPicture: CircleAvatar(
                      radius:55,
                      backgroundImage: AssetImage('assets/saaad.jpg')
                  ),
                ),
                ListTile(
                  title: Text('Home',style: TextStyle(color: Colors.black,fontSize: 18),),
                  leading: Icon(Icons.home),
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder:
                        (Context)=>home()));
                  },
                ),

                ListTile(
                  title: Text('My products',style: TextStyle(color: Colors.black,fontSize: 18),),
                  leading: Icon(Icons.add_shopping_cart),
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder:
                        (Context)=>Checkout()));
                  },
                ),
                ListTile(
                  title: Text('About',style: TextStyle(color: Colors.black,fontSize: 18),),
                  leading: Icon(Icons.help_center),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('logout',style: TextStyle(color: Colors.black,fontSize: 18),),
                  leading: Icon(Icons.exit_to_app),
                  onTap: (){},
                ),
                SizedBox(height:305 ),

                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Container(
                      child: Text('Developed By/ Saad Attallah',style: TextStyle(fontSize: 18,color: Colors.black87),)),
                ),

              ],


            ),
          ),
          appBar: AppBar(

            backgroundColor:Colors.amberAccent,
            title: Text('Electrical shop'),
            actions: [
            Appbar()

            ],

          ),

         body:
   Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2/ 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
                itemCount: items.length,



                  itemBuilder: (BuildContext, int index){
                return GestureDetector(
                  onTap: (){
               Navigator.push(context, MaterialPageRoute(builder:
               (Context)=>Details(product:items[index])));

                  },
                  child: GridTile(child:
                  Stack(
                    children:[
                  Positioned(
                      top: 10,
                      right:10,
                      left: 10,
                      bottom: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                          child: Image.asset(items[index].imagepath)),
                    ),
                 ] ),
               footer: GridTileBar(
                 leading: Text('15\$'),
                 trailing:IconButton(
                           color: Colors.amberAccent,
                             onPressed: (){
                          Carddd.add(items[index]);
                             },
                             icon:Icon (Icons.add)
                          )






                    )
                    )

                    ,

                     );
                    }
     ))
      ));
   }
}



