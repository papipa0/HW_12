import 'package:flutter/material.dart';
import 'package:work_9/pages/homepage.dart';





class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = '';
  int inputSize = 6;
  int inputCount = 0;

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 100.0,
                        color: Colors.blue.shade900,
                      ),
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline1,

                      ),
                      Text(
                        'Enter PIN to login',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for(var i=0;i<inputCount;i++)
                            Icon(Icons.circle,color: Color(0xFF66B0D4),size: 30,),
                          for(var i=0;i<inputSize-inputCount;i++)
                            Icon(Icons.circle,color: Colors.white,size: 30)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // color: Colors.pink.shade300,
                child: Column(
                  children: [
                    [1,2,3],
                    [4,5,6],
                    [7,8,9],
                    [-2,0,-1],
                  ].map((row){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item){
                        return Padding(
                          padding : const EdgeInsets.all(8.0),
                          child: LoginButton(
                            number: item,
                            onClink: _handleClickButton,
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleClickButton(int num){
    print('$num');
    setState(() {
      if(num>-1){
        if(inputCount<inputSize){
          inputCount++;
          input = input + num.toString();
        }
      }else if(num==-1){
        if(inputCount>0){
          inputCount--;
          input = input.substring(0, input.length - 1);
        }
      }
      print('$inputCount / $inputSize : $input');
      if(inputCount==inputSize){
        if(input=='123456'){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }else{
          _showMaterialDialog('ERROR', 'Invalid PIN Please try again.');
        }
        inputCount=0;
        input='';
      }
    });
  }
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClink;

  const LoginButton({
    required this.number,
    required this.onClink,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),

      onTap:number == -2 ? null : (){
        onClink(number);
      },
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration :  number == -2 ? null : BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.blue.shade100,
          border:  Border.all(width: 3.0),
        ),
        child: Center(
          child: number >= 0 ? Text(
            '$number',
            style: Theme.of(context).textTheme.headline6,
          )
              : (number== -1
              ? Icon(Icons.backspace,size: 28.0,)
              : SizedBox.shrink()),
        ),
      ),
    );
  }
}


