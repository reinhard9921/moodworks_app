import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Color.fromRGBO(204, 255, 229, 80),
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }

}