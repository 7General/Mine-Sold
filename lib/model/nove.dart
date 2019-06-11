
class Novel {
  String id;
  String name;
  String imgUrl;
  String firstChapter;
  
  String author;
  double price;
  double score;
  String type;
  String introduction;
  int chapterCount;
  int recommendCount;
  int commentCount;
  int firstArticleId;

  List<String> roles;
  String status;
  double wordCount;
  List<String> tags;
  bool isLimitedFree;

  Novel.fromJson(Map data) {
    id = data['bid'];
    firstArticleId = data['first_article_id'];
    name = data['bookname'];
    imgUrl = data['book_cover'];
    firstChapter = data['topic_first'];
    
    score = data['score'];
    author = data['author_name'];
    price = double.parse(data['price'] ?? '0');
    type = data['class_name'];
    introduction = data['introduction'];
    chapterCount = int.parse(data['chapterNum'] ?? '0');
    recommendCount = int.parse(data['recommend_num'] ?? '0');
    commentCount = int.parse(data['comment_count'] ?? '0');

    status = data['stat_name'];
    wordCount = data['wordCount'];
    tags = data['tag']?.cast<String>()?.toList();

    isLimitedFree = data['is_free'] == 1;
  }
}