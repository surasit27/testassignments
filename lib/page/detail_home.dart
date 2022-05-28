import 'package:flutter/material.dart';
import 'package:testassignments/model/data_model.dart';
import 'package:testassignments/utils/constant.dart';

class HomeDetail extends StatelessWidget {
  final DataModel dataModel;
  HomeDetail(this.dataModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(dataModel),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage('${dataModel.profileImageUrl}'),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ratingStas(dataModel.rating),
                        SizedBox(width: 8),
                        Text(
                          '${dataModel.rating}',
                          style: TextStyle(fontSize: 16, color: Colors.amber),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${dataModel.name}',
                      style: Constant().h2Style(),
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          List.generate(dataModel.categories.length, (index) {
                        final dataCategories = dataModel.categories[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.all(8),
                            child: Text(
                              dataCategories,
                              style: Constant().h4Style(),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Address :',
                      style: Constant().h2Style(),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${dataModel.address}',
                      style: Constant().h4Style(),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Opening Hour :',
                      style: Constant().h2Style(),
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(dataModel.operationTime.length,
                          (index) {
                        final operationTimedata =
                            dataModel.operationTime[index];
                        if (operationTimedata.timeOpen == "closed" ||
                            operationTimedata.timeClose == "closed") {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${operationTimedata.day}: ${operationTimedata.timeOpen}',
                                    style: Constant().h4Style(),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${operationTimedata.day}: ${operationTimedata.timeOpen} - ${operationTimedata.timeClose}',
                                    style: Constant().h4Style(),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      }),
                    ),
                    SizedBox(height: 16),
                    Row(
                        children:
                            List.generate(dataModel.images.length, (index) {
                      final dataImage = dataModel.images[index];
                      return Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Image.network(
                            dataImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    })),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

////////////////////BuildImage
Widget _buildImage(String dataImage, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: 1000,
        height: 1000,
        child: Image.network(
          dataImage,
          fit: BoxFit.cover,
        ),
      ),
    );

////////////////////RatingStas
Text _ratingStas(double rating) {
  String stars = '';
  for (int i = 0; i < rating; i++) {
    stars += '⭐';
  }
  return Text(stars);
}

//////////////////////APPBAR
AppBar _appBar(DataModel dataModel) {
  return AppBar(
    backgroundColor: Constant.dark,
    title: Text(dataModel.name),
  );
}
