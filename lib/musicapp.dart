//class Music {
 /* List<Music>? music;

  music({this.music});

  music.fromJson(Map<String, dynamic> json) {
    if (json['music'] != null) {
      music = <Music>[];
      json['music'].forEach((v) { music!.add(new Music.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.music != null) {
      data['music'] = this.music!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}*/

class Music {
  dynamic id;
  dynamic title;
  dynamic  album;
  dynamic  artist;
  dynamic  genre;
  dynamic  source;
  dynamic  image;
  dynamic  trackNumber;
  dynamic  totalTrackCount;
  dynamic  duration;
  dynamic  site;

  Music({this.id, this.title, this.album, this.artist, this.genre, this.source, this.image, this.trackNumber, this.totalTrackCount, this.duration, this.site});

  Music.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    album = json['album'];
    artist = json['artist'];
    genre = json['genre'];
    source = json['source'];
    image = json['image'];
    trackNumber = json['trackNumber'];
    totalTrackCount = json['totalTrackCount'];
    duration = json['duration'];
    site = json['site'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['album'] = this.album;
    data['artist'] = this.artist;
    data['genre'] = this.genre;
    data['source'] = this.source;
    data['image'] = this.image;
    data['trackNumber'] = this.trackNumber;
    data['totalTrackCount'] = this.totalTrackCount;
    data['duration'] = this.duration;
    data['site'] = this.site;
    return data;
  }
}

