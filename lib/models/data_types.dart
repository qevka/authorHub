enum DataType {
  author,
  authors,
  book,
  books,
  chapters,
  countries,
  photos,
  series,
  stores,
}

extension DataTypeExtension on DataType {
  // This is used for specific lookups.
  String get url {
    switch (this) {
      case DataType.author:
        return "https://jsonapiplayground.reyesoft.com/v2/authors";
      case DataType.authors:
        return "https://jsonapiplayground.reyesoft.com/v2/authors";
      case DataType.book:
        return "https://jsonapiplayground.reyesoft.com/v2/books";
      case DataType.books:
        return "https://jsonapiplayground.reyesoft.com/v2/books";
      case DataType.chapters:
        return "https://jsonapiplayground.reyesoft.com/v2/chapters";
      case DataType.countries:
        return "https://jsonapiplayground.reyesoft.com/v2/countries";
      case DataType.photos:
        return "https://jsonapiplayground.reyesoft.com/v2/photo";
      case DataType.series:
        return "https://jsonapiplayground.reyesoft.com/v2/series";
      case DataType.stores:
        return "https://jsonapiplayground.reyesoft.com/v2/stores";
    }
  }

  String get stringVal {
    return toString().split(".").last;
  }

  static DataType tryParse(String str) {
    try {
      return DataType.values.firstWhere((e) => e.stringVal == str.toLowerCase());
    } catch (ex) {
      print("DATATYPE NOT FOUND $ex");
      throw ex;
    }
    return DataType.author;
  }
}
