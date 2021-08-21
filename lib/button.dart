import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final Function ontap;
  final String text;
  final Color color;
  final double height;
  final double width;
  final Color shadowcolor;
  final Color borderColour;
  const CustomButton({
    this.ontap,
    this.text,
    this.color,
    this.height,
    this.width,
    this.shadowcolor,
    this.borderColour,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: ontap,
        child: Container(
          height: height == null ? size.height * 0.06 : height,
          width: width == null ? size.width * 0.12 : width,
          decoration: BoxDecoration(
              color: color == null ? Color(0xff024BBC) : color,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                  color:
                      borderColour == null ? Color(0xff024BBC) : borderColour),
              boxShadow: [
                BoxShadow(
                  color: shadowcolor == null
                      ? Color(0xff085dcf).withOpacity(0.3)
                      : shadowcolor.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: Offset(3, 7), // changes position of shadow
                ),
              ]),
          child: Center(
            child: Text(text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                )),
          ),
        ));
  }
}
