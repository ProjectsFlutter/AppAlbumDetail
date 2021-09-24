import 'package:flutter/material.dart';

class AlbumDetail extends StatelessWidget {
  const AlbumDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          onPressed: (){},
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent
      ),
      body: Center(
        child: Container(
        ),
      ),
    );
  }
}
