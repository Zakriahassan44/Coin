class ArticleModel {
  List<Article>? article;
  int? success;

  ArticleModel({this.article, this.success});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    if (json['article'] != null) {
      article = <Article>[];
      json['article'].forEach((v) {
        article!.add(Article.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.article != null) {
      data['article'] = this.article!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Article {
  String? id;
  String? title;
  String? short;
  String? description;
  String? published;
  String? picture;

  Article(
      {this.id,
        this.title,
        this.short,
        this.description,
        this.published,
        this.picture});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    short = json['short'];
    description = json['description'];
    published = json['published'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short'] = this.short;
    data['description'] = this.description;
    data['published'] = this.published;
    data['picture'] = this.picture;
    return data;
  }
}