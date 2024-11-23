import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Model/artical_model.dart';
import '../../../Services/coin_services.dart';
import '../../../Widgets/custom_listtile.dart';
import 'article_details_screen.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  late Future<ArticleModel> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = CoinServices().fetchArticles();
  }

  Future<void> _refreshCoins() async {
    setState(() {
      futureArticles = CoinServices().fetchArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: RefreshIndicator(
        onRefresh: _refreshCoins,
        backgroundColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.tertiary,
        child: FutureBuilder<ArticleModel>(
          future: futureArticles,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.article == null) {
              return const Center(child: Text("No articles found"));
            }
            final articles = snapshot.data!.article!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: CustomListTile(
                    title: article.title ?? 'No title',
                    description: article.short ?? 'No short description',
                    image:
                        'https://awamisolution.com/coins/api/coinsarticle/picture/${article.picture}',
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ArticleDetailsScreen(
                            artical: article,
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = const Offset(0.0, 1.0);
                            var end = Offset.zero;
                            var curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
