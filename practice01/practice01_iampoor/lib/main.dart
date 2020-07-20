import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.pink[100],
          appBar: AppBar(
            title: Text('정은지'),
            backgroundColor: Colors.red[300],
          ),
          body: Center(
            child: Image(
              image: NetworkImage(
                  'https://img.sbs.co.kr/newsnet/etv/upload/2018/10/21/30000615514_700.jpg'),
            ),
          ),
        ),
      ),
    );
