class UrbanResponse {
  List<Definition> list;

  UrbanResponse({this.list});

  UrbanResponse.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<Definition>();
      json['list'].forEach((v) {
        list.add(new Definition.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Definition {
  String definition;
  String permalink;
  int thumbsUp;
  List<String> soundUrls;
  String author;
  String word;
  int defid;
  String currentVote;
  String writtenOn;
  String example;
  int thumbsDown;

  Definition(
      {this.definition,
      this.permalink,
      this.thumbsUp,
      this.soundUrls,
      this.author,
      this.word,
      this.defid,
      this.currentVote,
      this.writtenOn,
      this.example,
      this.thumbsDown});

  Definition.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    permalink = json['permalink'];
    thumbsUp = json['thumbs_up'];
    soundUrls = json['sound_urls'].cast<String>();
    author = json['author'];
    word = json['word'];
    defid = json['defid'];
    currentVote = json['current_vote'];
    writtenOn = json['written_on'];
    example = json['example'];
    thumbsDown = json['thumbs_down'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['definition'] = this.definition;
    data['permalink'] = this.permalink;
    data['thumbs_up'] = this.thumbsUp;
    data['sound_urls'] = this.soundUrls;
    data['author'] = this.author;
    data['word'] = this.word;
    data['defid'] = this.defid;
    data['current_vote'] = this.currentVote;
    data['written_on'] = this.writtenOn;
    data['example'] = this.example;
    data['thumbs_down'] = this.thumbsDown;
    return data;
  }
}