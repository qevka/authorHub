class Authors {
  Meta? meta;
  List<Data>? data;
  List<Included>? included;

  Authors({this.meta, this.data, this.included});

  Authors.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta?.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    if (json['included'] != null) {
      included = <Included>[];
      json['included'].forEach((v) {
        included?.add(Included.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta?.toJson();
    }
    if (data != null) {
      data['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (included != null) {
      data['included'] = included?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int? page;
  int? resourcesPerPage;
  int? totalResources;

  Meta({this.page, this.resourcesPerPage, this.totalResources});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    resourcesPerPage = json['resources_per_page'];
    totalResources = json['total_resources'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    data['resources_per_page'] = resourcesPerPage;
    data['total_resources'] = totalResources;
    return data;
  }
}

class Data {
  String? type;
  String? id;
  Attributes? attributes;
  Relationships? relationships;
  Links? links;

  Data({this.type, this.id, this.attributes, this.relationships, this.links});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes?.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships?.fromJson(json['relationships'])
        : null;
    links = json['links'] != null ? Links?.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes?.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships?.toJson();
    }
    if (links != null) {
      data['links'] = links?.toJson();
    }
    return data;
  }
}

class Attributes {
  String? name;
  String? birthplace;
  String? dateOfBirth;
  String? dateOfDeath;

  Attributes({this.name, this.birthplace, this.dateOfBirth, this.dateOfDeath});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    birthplace = json['birthplace'];
    dateOfBirth = json['date_of_birth'];
    dateOfDeath = json['date_of_death'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['birthplace'] = birthplace;
    data['date_of_birth'] = dateOfBirth;
    data['date_of_death'] = dateOfDeath;
    return data;
  }
}

class Relationships {
  Photos? photos;
  Photos? books;

  Relationships({this.photos, this.books});

  Relationships.fromJson(Map<String, dynamic> json) {
    photos = json['photos'] != null ? Photos?.fromJson(json['photos']) : null;
    books = json['books'] != null ? Photos?.fromJson(json['books']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (photos != null) {
      data['photos'] = photos?.toJson();
    }
    if (books != null) {
      data['books'] = books?.toJson();
    }
    return data;
  }
}

class Photos {
  List<Data>? data;

  Photos({this.data});

  Photos.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? type;
  String? id;

  Data({this.type, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    return data;
  }
}

class Links {
  String? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['self'] = self;
    return data;
  }
}

class Included {
  String? type;
  String? id;
  Attributes? attributes;
  Links? links;

  Included({this.type, this.id, this.attributes, this.links});

  Included.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes?.fromJson(json['attributes'])
        : null;
    links = json['links'] != null ? Links?.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes?.toJson();
    }
    if (links != null) {
      data['links'] = links?.toJson();
    }
    return data;
  }
}

class Attributes {
  String? title;
  String? uri;
  String? datePublished;
  int? isbn;

  Attributes({this.title, this.uri, this.datePublished, this.isbn});

  Attributes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    uri = json['uri'];
    datePublished = json['date_published'];
    isbn = json['isbn'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['uri'] = uri;
    data['date_published'] = datePublished;
    data['isbn'] = isbn;
    return data;
  }
}
