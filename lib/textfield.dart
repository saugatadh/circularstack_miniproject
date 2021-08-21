import 'package:flutter/material.dart';class NewTextfield extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
 

  NewTextfield({
  
    this.textController,
   
    this.hintText,
    
    
   
  }) ;

  @override
  _NewTextfieldState createState() => _NewTextfieldState();
}

class _NewTextfieldState extends State<NewTextfield> {
  Color focuscolor = Color(0xffaaabac);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.068,
      width: size.width * 0.3,
      child: TextField(
        onTap: () {
          setState(() {
            focuscolor = Color(0xff085dcf);
          });
        },
        cursorColor: Color(0xffaaabac),
        controller: widget.textController,
        
        
        style: TextStyle(color: Color(0xffaaabac)),
        decoration: InputDecoration(
          
           
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Color(0xffaaabac), fontSize: 14),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focuscolor, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          filled: true,
          fillColor: Color(0xff0E161F),
          
        ),
      ),
    );
  }
}


