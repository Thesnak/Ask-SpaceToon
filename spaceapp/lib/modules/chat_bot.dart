import 'dart:async';
import 'dart:convert';
import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';
class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<String> _data = [];
  static const String BOT_URL =
      "https://nasa-space-bot.herokuapp.com/bot"; // replace with server address
  TextEditingController _queryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("SpaceToon"),
      ),
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              alignment: Alignment(-.2, 0),
              image: NetworkImage(
                  'https://www.whatspaper.com/wp-content/uploads/2021/05/hd-nasa-wallpaper-whatspaper-2.jpg'),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedList(
              // key to call remove and insert from anywhere
                key: _listKey,
                initialItemCount: _data.length,
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  return _buildItem(_data[index], animation, index);
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                    hintText: ("Send Message"),
                    hintStyle: TextStyle(color: Colors.white10),
                    suffixIcon:IconButton(
                        onPressed: (){
                          this._getResponse();
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        )
                    ) ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((16)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ), )

                ),
                controller: _queryController,
                textInputAction: TextInputAction.send,
                onSubmitted: (msg) {
                  this._getResponse();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  http.Client _getClient() {
    return http.Client();
  }

  void _getResponse() {
    if (_queryController.text.length > 0) {
      this._insertSingleItem(_queryController.text);
      var client = _getClient();
      try {
        client.post(
          BOT_URL,
          body: {"query": _queryController.text},
        )..then((response) {
          Map<String, dynamic> data = jsonDecode(response.body);
          _insertSingleItem(data['response'][0] + "<bot>");
        });
      } catch (e) {
        print("Failed -> $e");
      } finally {
        client.close();
        _queryController.clear();
      }
    }
  }

  void _insertSingleItem(String message) {
    _data.add(message);
    _listKey.currentState?.insertItem(_data.length - 1);
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    bool mine = item.endsWith("<bot>");
    return SizeTransition(
        sizeFactor: animation,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
              alignment: mine ? Alignment.topLeft : Alignment.topRight,
              child: Bubble(
                child:  ReadMoreText(
                  item.replaceAll("<bot>", ""),
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show More',
                  trimExpandedText: 'Show Less',
                  moreStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /*
                Text(
                    item.replaceAll("<bot>", ""),
                ),
                 */
                color: mine ? Colors.white : Colors.blueGrey,
                padding: BubbleEdges.all(10),
              )),
        ));

  }
}
