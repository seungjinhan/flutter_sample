import 'package:flutter/material.dart';
import '../models/photo_model.dart';

class PhotoList extends StatelessWidget {
  final List<PhotoModel> pList;

  PhotoList(this.pList);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: pList.length,
      itemBuilder: (context, index) {
        return _buildPhoto(pList[index]);
      },
    ));
  }

  Widget _buildPhoto(PhotoModel pModel) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              child: Image.network(pModel.url),
              padding: const EdgeInsets.only(bottom: 8.0),
            ),
            Text(pModel.title),
          ],
        ));
  }
}
