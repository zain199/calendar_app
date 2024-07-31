import 'package:flutter/material.dart';


BoxShadow shadow({required Color color})
{
  return  BoxShadow(color: color, offset: Offset(4, 16) , blurRadius: 32 , spreadRadius: 0);
}