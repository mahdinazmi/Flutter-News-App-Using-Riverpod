class NewsModel {
  String ? status;
  int ? totalResults;
  List < Article > ? articles;

  NewsModel({
    this.status,
    this.totalResults,
    this.articles
  });

  NewsModel.fromJson(Map < String, dynamic > json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = < Article > [];
      json['articles'].forEach((v) {
        articles!.add(Article.fromJson(v));
      });
    }
  }

  Map < String, dynamic > toJson() {
    final Map < String, dynamic > data = < String, dynamic > {};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Article {
  String ? author;
  String ? title;
  String ? description;
  String ? url;
  String ? urlToImage;
  String ? publishedAt;
  String ? content;

  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content
  });

  Article.fromJson(Map < String, dynamic > json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map < String, dynamic > toJson() {
    final Map < String, dynamic > data = < String, dynamic > {};
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}
