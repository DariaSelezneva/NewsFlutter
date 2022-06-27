import 'dart:core';

class Post {

  int id;
  String userId;
  String title;
  String description;
  String image;
  String username;
  List<String> tags;

  Post({required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.image,
    required this.username,
    required this.tags
  }
  );

  static List<Post> sample = [
    Post(
        id: 3767,
        userId: "f52bec9a-e11e-46f7-8b0f-83aa58593dca",
        title: "Cat",
        description: "What do you want from me, human?",
        image: "https://news-feed.dunice-testing.com/api/v1/file/2d58842e-80b0-4491-974b-922431b65483.",
        username: "Daria",
        tags: []),
    Post(
        id: 3768,
        userId: "f52bec9a-e11e-46f7-8b0f-83aa58593dca",
        title: "Expecto patronum",
        description: "Asrdhtjfgkhk",
        image: "https://news-feed.dunice-testing.com/api/v1/file/825bdffb-c211-468f-a26b-bc2f12a3b281.",
        username: "Daria",
        tags: []),
    Post(
        id: 3769,
        userId: "f52bec9a-e11e-46f7-8b0f-83aa58593dca",
        title: "Tardis",
        description: "Wibbly-wobbly timely-wimey #stuff",
        image: "https://news-feed.dunice-testing.com/api/v1/file/ca87f775-d254-4275-b070-80c7547e2b94.",
        username: "Daria",
        tags: ["stuff"]),
    Post(
        id: 3780,
        userId: "f52bec9a-e11e-46f7-8b0f-83aa58593dca",
        title: "Join me in the Dark Side",
        description: "We have #cookies!",
        image: "https://news-feed.dunice-testing.com/api/v1/file/70b02f1d-5340-4dad-87cc-29506c7f4668.",
        username: "Daria",
        tags: ["cookies", "stuff", "stuff1"]),
    Post(
        id: 3796,
        userId: "f52bec9a-e11e-46f7-8b0f-83aa58593dca",
        title: "Awsefdghdsfdgh",
        description: "Sdfghn",
        image: "https://news-feed.dunice-testing.com/api/v1/file/ecc82888-81a7-483a-bf69-c9ad3dc77425.",
        username: "Daria",
        tags: [])
  ];
}
