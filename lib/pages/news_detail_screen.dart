import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/news_detail_bloc/news_detail.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsDetailBloc, NewsDetailState>(
        builder: (context, state) {
          if (state is NewsDetailLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsDetailLoadedState) {
            return WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: state.newsDetail.url,
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
