class Repository {
  final int id;
  final String avatar;
  final String nameRepository;
  final String nameUser;
  final String urlRepository;

  Repository(
      {this.id,
      this.avatar,
      this.nameRepository,
      this.nameUser,
      this.urlRepository});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: json['id'],
      avatar: json['owner']['avatar_url'],
      nameRepository: json['name'],
      nameUser: json['owner']['login'],
      urlRepository: json['html_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner']['avatar_url'] = this.avatar;
    data['name'] = this.nameRepository;
    data['owner']['login'] = this.nameUser;
    data['html_url'] = this.urlRepository;
    return data;
  }
}
