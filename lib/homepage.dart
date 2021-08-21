import 'package:circularstack/button.dart';
import 'package:circularstack/textfield.dart';
import 'package:flutter/material.dart';
import 'package:circularstack/stack.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final object = Get.put(CircularStack());

  final insertController = TextEditingController();

  
  String result = '';
  List<int> list= [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("Mini Project Demonstration",style: TextStyle(letterSpacing: 1.2,color: Colors.white70),)),
        leading: Icon(Icons.menu),
        backgroundColor: Color(0xff0E161F)
      ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment : CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
              Container(
                height: size.height * 0.6,
                width: size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Color.fromARGB(255, 26, 32, 43),
                  color: Color(0xff0E161F)
                ),

              child: Padding(
                padding: const EdgeInsets.only(top:80.0),
                child: (list.length != 0) ? CustomPaint( //                       <-- CustomPaint widget
                      // size: const Size(300, 300),
                      painter: MyPainter(),
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                       children :[
                         
                         for(var e in list) Container(
                           height: 80,
                           width : 80,
                           color: Color(0xff3D9267),
                           child: Center(child: Text(e.toString(),style: TextStyle(fontSize:18,color: Colors.white)))
                         
                         )
                       ]
                      )
                
                
                    ):
                    Center(child: Text("The Stack is empty. Try inserting some data", style: TextStyle(color: Colors.white70,letterSpacing: 1.5,wordSpacing: 1),))
              ) ,

              ),


              

              
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NewTextfield(
                    hintText: 'Enter a value',
                    textController: insertController,
                  ),
                  SizedBox(width: 30,),
                  CustomButton(text: 'Push',
                  color: Colors.redAccent,
                  borderColour: Colors.redAccent,
                  shadowcolor: Colors.red,
                    ontap: (){

                     
                      if(object.counter == MAX_STACK_SIZE){
                        
                        setState(() {
                          result = 'The stack is full and cannot insert more data';
                        });
                      }else{
                        object.push(int.parse(insertController.text));
                     
                      setState(() {
                        result = '${insertController.text} is inserted in the stack';
                        list = object.display();
                      });
                      }

                       insertController.clear();           
                      
                    },
                  ),
                  SizedBox(width: 30,),
                 
                ],
              ),
              SizedBox(height: 30,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(text: 'Pop',
                    ontap: (){
                        int popvalue = object.pop();
                        setState(() {
                          result = '$popvalue is popped from the stack';
                          list= object.display();
                        });
                        
                    },
                  ),
                  SizedBox(width: 50,),
                  CustomButton(text: 'Top',
                      ontap: (){
                          setState(() {
                             result = '${object.top()} is the top value of  Stack';
                          });
                       
                      },
                  ),
                  SizedBox(width: 50,),
                  CustomButton(text: 'isEmpty',
                    ontap: (){
                      if(object.isEmpty()==true){
                          setState(() {
                            result = 'The  Stack is empty!!';
                          });
                      }else{
                        setState(() {
                          result = 'The  Stack is not empty!!';
                        });
                      }
                    },
                  
                  ),
                  SizedBox(width: 50,),
                  CustomButton(text: 'isFull',
                    ontap: (){
                        if(object.counter==MAX_STACK_SIZE){
                          setState(() {
                            result = 'The  Stack is Full!!';
                          });
                      }else{
                        setState(() {
                          result = 'The  Stack is not full.You can insert ${MAX_STACK_SIZE - object.counter} more data in stack!!';
                        });
                      }
                    },
                  
                  ),
                ],
              ),
              SizedBox(height: 20,),
               Text(result,style: TextStyle(fontSize: 18,color: Colors.green),),
              SizedBox(height: 20,),
        
            ],),
          ),
        )
    );
  }
}




class MyPainter extends CustomPainter { //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
       var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
      
    final a = Offset(size.width*0.02,size.height * 0.02);
    final b = Offset(size.width*0.98,size.height * 0.5);
    final rect = Rect.fromPoints(a,b);
    canvas.drawRect(rect,paint);
                                       
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}