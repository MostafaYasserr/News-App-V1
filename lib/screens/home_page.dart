import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_sliverlist_builder.dart';
import '../widgets/categories_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'News',
                  style: TextStyle(),
                ),
                TextSpan(
                  text: 'Cloud',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CategoriesListView(),
            )),
            const NewsSliverListBuilder(category: ''),
          ],
        ),
      ),
    );
  }
}
