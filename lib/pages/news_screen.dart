import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/news_bloc/news.dart';
import 'package:flutter_bloc_first/data/repository/api_service_repository.dart';
import 'package:flutter_bloc_first/models/index.dart';
import 'package:flutter_bloc_first/navigation/routes/app_routes.dart';
import 'package:intl/intl.dart';

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
            title: const Text("Tin tức"),
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
                          return itemNews(item);
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

  itemNews(NewsModel item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.news_detail, arguments: item);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 100,
        child: Row(
          children: [
            Image.network(
              item.urlToImage ??
                  "https://dci.edu.vn/wp-content/themes/consultix/images/no-image-found-360x250.png",
              height: 100,
              width: 140,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.network(
                    'https://dci.edu.vn/wp-content/themes/consultix/images/no-image-found-360x250.png');
              },
            ),
            SizedBox(width: 5),
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
                        DateFormat('yyyy-MM-dd hh:mm')
                            .format(DateTime.parse(
                                item.publishedAt ?? DateTime.now().toString()))
                            .toString(),
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
