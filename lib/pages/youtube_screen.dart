import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              Icon(FontAwesomeIcons.youtube, color: Colors.red, size: 30)
            ]),
            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return itemYoutube();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemYoutube() {
    return Container(
        child: Column(
      children: [
        Image(
          image: NetworkImage(
              "https://dci.edu.vn/wp-content/themes/consultix/images/no-image-found-360x250.png"),
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Image(
                image: NetworkImage(
                    "https://dci.edu.vn/wp-content/themes/consultix/images/no-image-found-360x250.png"),
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "title",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("aaa"),
                  ],
                ),
              ),
            ),
            Icon(FontAwesomeIcons.ellipsisVertical)
          ],
        )
      ],
    ));
  }
}
