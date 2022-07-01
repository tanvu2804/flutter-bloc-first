import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/news_bloc/news.dart';
import 'package:flutter_bloc_first/data/repository/api_service_repository.dart';
import 'package:flutter_bloc_first/models/index.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ApiServiceRepository(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("News"),
            centerTitle: true,
          ),
          body: BlocProvider(
            create: (context) =>
                NewsBloc(RepositoryProvider.of<ApiServiceRepository>(context))
                  ..add(LoadNewsEvent()),
            child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
              if (state is NewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is NewsLoadedState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.news.length,
                        itemBuilder: (context, index) {
                          NewsModel item = state.news[index];
                          return ItemNews(item);
                        },
                      )
                    ],
                  ),
                );
              }
              if (state is NewsErrorState) {
                return Center(
                  child: Text(state.error.toString()),
                );
              }
              return Container();
            }),
          )),
    );
  }

  ItemNews(NewsModel item) {
    print(item);
    return Container(
      height: 100,
      child: Row(
        children: [
          Image(
            image: NetworkImage(item.urlToImage ?? ""),
            height: 100,
            width: 140,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title ?? "",
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 18),
                    SizedBox(width: 5),
                    Text(
                      item.publishedAt ?? "",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
