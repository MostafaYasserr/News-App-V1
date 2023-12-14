// import 'package:flutter/material.dart';
// import 'package:news_app/services/news_services.dart';
// import 'package:news_app/widgets/news_sliverlist.dart';
// import '../models/news_model.dart';
//
// class NewsSliverListBuilder extends StatefulWidget {
//   const NewsSliverListBuilder({super.key});
//
//   @override
//   State<NewsSliverListBuilder> createState() => _NewsSliverListBuilderState();
// }
//
// class _NewsSliverListBuilderState extends State<NewsSliverListBuilder> {
//   List<NewsModel> newsList = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     getGeneralNews();
//   }
//
//   Future<void> getGeneralNews() async {
//     newsList = await NewsService().getNews();
//     isLoading = false;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const SliverToBoxAdapter(
//             child: Center(child: CircularProgressIndicator()))
//         : NewsSliverList(newsList: newsList);
//   }
// }

import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/news_sliverlist.dart';
import '../services/news_services.dart';

class NewsSliverListBuilder extends StatefulWidget {
  const NewsSliverListBuilder({
    super.key,
    required this.category,
  });
  final String category;

  @override
  State<NewsSliverListBuilder> createState() => _NewsSliverListBuilderState();
}

class _NewsSliverListBuilderState extends State<NewsSliverListBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService().getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsSliverList(
              newsList: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'oops there was an error ,try again later',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
