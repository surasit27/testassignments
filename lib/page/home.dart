import 'dart:async';
import 'dart:convert';
import 'package:testassignments/api/search_api.dart';
import 'package:testassignments/model/data_model.dart';
import 'package:testassignments/utils/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rooBundle;
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'detail_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DataModel> datamodel = [];
  late int day;
  late int weekDay;
  late int month;
  late int year;
  late String dayName;

  @override
  void initState() {
    super.initState();
    ReadJsonData();
    day = DateTime.now().day;
    weekDay = DateTime.now().weekday;
    month = DateTime.now().month;
    year = DateTime.now().month;
    dayName = getDay(weekDay);
    Timer.periodic(Duration(seconds: 1), (Timer t) => getDate());
  }

  getDate() {
    setState(() {
      day = DateTime.now().day;
      weekDay = DateTime.now().weekday;
      month = DateTime.now().month;
      year = DateTime.now().month;
      dayName = getDay(weekDay);
    });
  }

  Future<Null> ReadJsonData() async {
    final response =
        await rooBundle.rootBundle.loadString('assets/example_data.json');
    final List jsonFromData = json.decode(response);
    List<DataModel> result =
        jsonFromData.map((e) => DataModel.fromJson(e)).toList();
    for (var item in result) {
      print(item.operationTime[0].day);
      setState(() {
        datamodel.add(item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 0),
            child: TypeAheadField<DataModel?>(
              hideSuggestionsOnKeyboardHide: false,
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Constant.dark,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constant.dark),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constant.light),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Search Shop',
                  border: InputBorder.none,
                ),
              ),
              suggestionsCallback: SearchApi.getDataSuggestions,
              itemBuilder: (context, DataModel? suggestion) {
                final dataModel = suggestion!;
                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                    child: Container(
                      width: 80,
                      height: 60,
                      child: Image.network(
                        dataModel.profileImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(dataModel.name),
                );
              },
              noItemsFoundBuilder: (context) => Container(
                height: 80,
                child: Center(
                  child: Text(
                    'No Shop Found.',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              onSuggestionSelected: (DataModel? suggestion) {
                final dataModel = suggestion!;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeDetail(dataModel)));
              },
            ),
          ),
          Column(
            children: List.generate(datamodel.length, (index) {
              if (datamodel.length == 0) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    _card(datamodel[index]),
                  ],
                );
              }
            }),
          )
        ],
      ),
    );
  }

/////////////////CARD
  Widget _card(DataModel dataModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 8, left: 8),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeDetail(dataModel)));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
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
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeDetail(dataModel)));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${dataModel.name}',
                          style: Constant().h2Style(),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '$dayName',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Container(
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                          height: 180,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enableInfiniteScroll: false
                          // viewportFraction: 1,
                          // reverse: true,
                          ),
                      itemCount: dataModel.images.length,
                      itemBuilder: (context, index, realIndex) {
                        final dataImage = dataModel.images[index];
                        return _buildImage(dataImage, index);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

////////////////////////GETDAY
String getDay(int weekDay) {
  String t = "";
  switch (weekDay) {
    case 1:
      {
        t = "9:00 - 22.00";
        break;
      }
    case 2:
      {
        t = "9:00 - 22.00";
        break;
      }
    case 3:
      {
        t = "9:00 - 22.00";
        break;
      }
    case 4:
      {
        t = "9:00 - 22.00";
        break;
      }
    case 5:
      {
        t = "9:00 - 22.00";
        break;
      }
    case 6:
      {
        t = "closed";
        break;
      }
    case 7:
      {
        t = "closed";
        break;
      }
  }
  return t;
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
AppBar _appBar() {
  return AppBar(
    backgroundColor: Constant.dark,
  );
}
