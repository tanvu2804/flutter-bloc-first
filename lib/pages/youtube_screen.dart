import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/data.dart';
import 'package:flutter_bloc_first/models/video_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.youtube, color: Colors.red, size: 30),
        actions: [
          Row(children: [
            Icon(Icons.videocam_outlined, color: Colors.red, size: 25),
            SizedBox(width: 10),
            Icon(FontAwesomeIcons.bell, color: Colors.red, size: 20),
            SizedBox(width: 10),
            Icon(Icons.search, color: Colors.red, size: 25),
            SizedBox(width: 10),
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child:
                    Icon(FontAwesomeIcons.user, color: Colors.red, size: 20)),
            SizedBox(width: 10),
          ])
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: home_video.length,
                  itemBuilder: (context, index) {
                    VideoModel item = videoModelFromJson(home_video[index]);
                    return itemYoutube(item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemYoutube(item) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          child: Column(
        children: [
          Image(
            image: AssetImage(item.thumnailImg),
            height: 170,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image(
                    image: NetworkImage(item.profileImg),
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(item.dayAgo),
                      ],
                    ),
                  ),
                ),
                Icon(FontAwesomeIcons.ellipsisVertical, size: 20)
              ],
            ),
          )
        ],
      )),
    );
  }
}
