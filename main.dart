import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questionlist.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text('ASSAL VEDI',
            style: TextStyle(
                fontWeight: FontWeight.bold,

            ),),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

List<Icon> Scorecard=[

];





QuizBrain Q=QuizBrain();
class _QuizPageState extends State<QuizPage> {
  void checker(bool up){
    if (Q.End()==false)
   { setState(() {
      if(Q.getquestionanswer()==up) {
        Scorecard.add(Icon(Icons.check,
          color: Colors.green[400],),);
      } else
        Scorecard.add(Icon(Icons.close,
          color: Colors.red,),);

      Q.Nextq();
    });}
    else {
      Alert(context: context,title: 'FINISHED!',desc: 'You have reached the end',buttons: [
        DialogButton(
          child:Text('RESET'),
          onPressed:() {
            Navigator.pop(context);
            Q.Qnoret();
            setState(() {
              Scorecard.clear();

            });
          }
        )
      ]).show();

    }
    //The user picked true.
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
               Q.getquestiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checker(true);
               
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checker(false);

              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: Scorecard
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
