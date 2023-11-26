class Game {
  final String hiddenCardpath = 'assets/images/main.png';

  List<String>? gameImg;

  final List<String> cards_list=[
    "assets/images/dart1.png",
    "assets/images/Dart2.jpg",
    "assets/images/flutter.png",
    "assets/images/flutter2.png",
    "assets/images/flutter2.png",
    "assets/images/flutter.png",
    "assets/images/Dart2.jpg",
    "assets/images/java.png",
    "assets/images/dart1.png",
    "assets/images/java.png",
    "assets/images/js.png",
    "assets/images/js.png",


  ];

  List<Map<int,String>> mathCheck=[];

  final int cardCount = 12;

  void initGame(){
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}