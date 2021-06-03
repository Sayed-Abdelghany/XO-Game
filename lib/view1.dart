import 'package:flutter/material.dart';
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String>input=["","","","","","","","",""];
  bool turn =false;
  int Xscore = 0;
  int Oscore = 0;
  String winner ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("player X",style: TextStyle(
                        fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red),),
                    SizedBox(height: 10,),
                    Text(Xscore.toString(),style: TextStyle(
                        fontSize: 30,fontWeight: FontWeight.bold),),
                  ],
                ),
                Column(
                  children: [
                    Text("player O",style: TextStyle(
                        fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red),),
                    SizedBox(height: 10,),
                    Text(Oscore.toString(),style: TextStyle(
                        fontSize: 30,fontWeight: FontWeight.bold),),
                  ],
                ),

              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, ),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                )
                , itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    userTab(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center(
                      child: Text(input[index], style: TextStyle(
                          color: Colors.white, fontSize: 25),),
                    ),
                  ),
                );
              },
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Container(

              height: 50,
              width: 150,
              color: Colors.green,
              child:FlatButton(onPressed: (){
                setState(() {
                  playAgain();
                });
              },
                  child: Center(
                    child: Text("Start game",style: TextStyle(
               fontSize: 20,color: Colors.white),),
                   ),
              ),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Container(
              height: 50,
              width: 150,
              color: Colors.red,
              child : FlatButton(
                 onPressed: (){
                   setState(() {
                     endGame();
                   });
                 },
                      child:Center(
                           child: Text("End game",style: TextStyle(
                        fontSize: 20,color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  userTab(int i){
    if (turn == true &&input[i]==""){
      setState(() {
        input[i]='X';
      });
    }
    else if (turn==false&&input[i]==""){
      setState(() {
        input[i]='O';
      });
    }
    turn=!turn;
    checkWinner();
    score();
  }
  void checkWinner(){
    if (input[0]==input[1] && input[0]==input[2] && input[0]!=''){
      winner = input[0];
    } else if (input[3]==input[4] && input[3]==input[5] && input[3]!=''){
      winner = input[3];
  } else if (input[6]==input[7] && input[6]==input[8] && input[6]!=''){
      winner = input[6];
    } else if (input[0]==input[3] && input[0]==input[6] && input[0]!=''){
      winner = input[0];
    } else if (input[1]==input[4] && input[1]==input[7] && input[1]!=''){
      winner = input[1];
    } else if (input[2]==input[5] && input[2]==input[8] && input[2]!=''){
      winner = input[2];
    } else if (input[0]==input[4] && input[0]==input[8] && input[0]!=''){
      winner = input[0];
    } else if (input[2]==input[4] && input[2]==input[6] && input[2]!=''){
      winner = input[2];
    } else {
      print("no winner");
    }
  }
  void score () {
    if (winner == 'X') {
      setState(() {
        Xscore++;
        for (int i = 0; i < input.length; i++) {
          input[i] = '';
        }
      });
      winner = '';
    } else if (winner == 'O') {
      setState(() {
        Oscore++;
        for (int i = 0; i < input.length; i++) {
          input[i] = '';
        }
      });
      winner = '';
    }
  }
  void playAgain(){
    for(int i = 0; i<input.length;i++){
      input[i]='';
    }
    turn = false;
  } void endGame(){
    Xscore = Oscore = 0;
    for(int i = 0; i<input.length;i++ ){
      input[i]='';
    }
    turn=false;
  }
}