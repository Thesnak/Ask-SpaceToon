import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spaceapp/modules/chat_bot.dart';
import 'package:spaceapp/modules/search_details.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var  kPrimaryColor =Color(0xff2B475E);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration:const BoxDecoration(
          image:DecorationImage(
            image: NetworkImage(
              'https://img.freepik.com/free-vector/color-seamless-space-pattern_102902-2360.jpg?w=900&t=st=1664543475~exp=1664544075~hmac=a623f52238b48d91bf782eb332d80cf439dff09703bdd90710648150333a0ff3',

            ),

            fit: BoxFit.cover,
          ),

        ),

        child:
          TextField(
            onSubmitted: (value){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>ScreenDetails(screen: value,),),
              );
            },
           style: TextStyle(
             color: Colors.white
           ),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,color: Colors.white,),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 3, color:kPrimaryColor ),

            ),
            hintText:'Search',
            hintStyle: TextStyle(color: Colors.white,fontSize: 20),
          ),

        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>ChatBot()),
          );
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.chat,
          color: Colors.black,
        ),
      ),
    );
  }
}
