import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/count_bloc/count.dart';
import 'package:flutter_bloc_first/blocs/news_bloc/news.dart';
import 'package:flutter_bloc_first/data/repository/api_service_repository.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News"),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) =>
              NewsBloc(RepositoryProvider.of<ApiServiceRepository>(context))
                ..add(LoadNewsEvent()),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsLoadedState) {
                print(state.news);
                return Column(
                  children: [
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          const Image(
                            image: NetworkImage(
                                "https://bloximages.newyork1.vip.townnews.com/stltoday.com/content/tncms/assets/v3/editorial/d/03/d0314607-cb5b-5fc9-8fb7-ec29e099369e/62b8f77be9ccb.image.jpg?crop=1717%2C901%2C0%2C152&resize=1200%2C630&order=crop%2Cresize"),
                            height: 100,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Two upcoming Cardinals games are off Bally. Here's where you can watch them.",
                                  maxLines: 4,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Icon(Icons.access_time, size: 18),
                                    SizedBox(width: 5),
                                    Text(
                                      "5 hours ago",
                                      style: TextStyle(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ));
  }
}
