import 'package:flutter/material.dart';
import 'package:weather/utilities/appColors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String city = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                onChanged: (value) {
                  city = value;
                },
                decoration: InputDecoration(hintText: 'City'),
                style: TextStyle(
                  color: MutedBlack,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, city);
                },
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: MutedBlack,
                  size: 40.0,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'myloc');
              },
              child: Container(
                height: 50,
                width: 85.0,
                margin: EdgeInsets.only(bottom: 25.0),
                decoration: BoxDecoration(
                  border: Border.all(color: MutedBlack, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Icon(
                  Icons.my_location_rounded,
                  color: MutedBlack,
                  size: 40.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
