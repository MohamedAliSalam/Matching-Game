import 'package:flutter/material.dart';
import 'package:projectone/utils/game_logic.dart';
import 'package:projectone/widgets/score_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:HomePage()
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Game _game=Game();
  int tries=0;

  Stopwatch stopwatch = Stopwatch();

  @override
  void initState() {
    // TODO: implement initState
    _game.cards_list.shuffle();
    super.initState();
    _game.initGame();
    stopwatch.start();

  }



  void resetGame() {
    setState(() {
      _game.cards_list.shuffle();
      _game.initGame();
      tries = 0;
      stopwatch.reset();
      stopwatch.start();

    });
  }

  @override
  Widget build(BuildContext context) {
    double screen_width=MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.black,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child:
            Text(
              "Memory Matching Game",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),

          ),
          SizedBox(
            height: 24.0,

          ),
          Text("Time" "\n ${stopwatch.elapsed.inSeconds} s" ,
            style:
            TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              scoreBoard("Tries", "${tries}"),


            ],
          ),
          SizedBox(
            height:screen_width,
            width: screen_width,

            child: GridView.builder(
                itemCount: _game.gameImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemBuilder: (context,index){
                  return GestureDetector(

                      onTap: (){
                        if (_game.gameImg![index] != _game.hiddenCardpath) {
                          // Card already flipped, do nothing
                          return;
                        }
                        print(_game.cards_list[index]);
                        setState(() {
                          tries++;
                          _game.gameImg![index]= _game.cards_list[index];
                          _game.mathCheck.add({index:_game.cards_list[index]});
                        });
                        if(_game.mathCheck.length == 2){
                          if(_game.mathCheck[0].values.first ==_game.mathCheck[1].values.first) {
                            print("true");

                            _game.mathCheck.clear();
                          }else{
                            print("false");
                            Future.delayed(Duration(milliseconds: 500),(){
                              print(_game.gameImg);
                              setState(() {
                                _game.gameImg![_game.mathCheck[0].keys.first]= _game.hiddenCardpath;
                                _game.gameImg![_game.mathCheck[1].keys.first]= _game.hiddenCardpath;
                                _game.mathCheck.clear();

                              });
                            });

                          }


                        }

                      },
                      child:Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(image: AssetImage(_game.gameImg![index]),
                              fit:BoxFit.cover,
                            )
                        ),
                      )) ;
                }
            ),
          ),
          SizedBox(
            height: 50.0, // Adjust the height as needed
            child: ElevatedButton(
              onPressed: resetGame,
              child: Text(
                'Reset Game',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
