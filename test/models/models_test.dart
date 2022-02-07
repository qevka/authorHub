import 'dart:convert';
import 'dart:io';

import 'package:author_hub/models/attributes/attribute_base.dart';
import 'package:author_hub/models/data_types.dart';
import 'package:author_hub/models/generic_data_model.dart';
import 'package:author_hub/models/pointer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Attributes: ", () {
    test("Authors", () async {
      final authorData = File('testData/attributes/authorAttrib.json');
      final jsonData = jsonDecode(await authorData.readAsString());
      AuthorAttributes authorAttrib = AuthorAttributes.fromJson(jsonData);
      expect(authorAttrib.toJson(), jsonData);
    });

    test("Books", () async {
      final bookData = File('testData/attributes/bookAttrib.json');
      final jsonData = jsonDecode(await bookData.readAsString());
      BookAttributes bookAttrib = BookAttributes.fromJson(jsonData);
      expect(bookAttrib.toJson(), jsonData);
    });

    test("Chapter", () async {
      final chapterData = File('testData/attributes/chapterAttrib.json');
      final jsonData = jsonDecode(await chapterData.readAsString());
      ChapterAttributes chapterAttrib = ChapterAttributes.fromJson(jsonData);
      expect(chapterAttrib.toJson(), jsonData);
    });

    test("Country", () async {
      final countryData = File('testData/attributes/countryAttrib.json');
      final jsonData = jsonDecode(await countryData.readAsString());
      CountryAttributes countryAttrib = CountryAttributes.fromJson(jsonData);
      expect(countryAttrib.toJson(), jsonData);
    });

    test("Photo", () async {
      final photoData = File('testData/attributes/photoAttrib.json');
      final jsonData = jsonDecode(await photoData.readAsString());
      PhotoAttributes photoAttrib = PhotoAttributes.fromJson(jsonData);
      expect(photoAttrib.toJson(), jsonData);
    });

    test("Series", () async {
      final seriesData = File('testData/attributes/seriesAttrib.json');
      final jsonData = jsonDecode(await seriesData.readAsString());
      SeriesAttributes seriesAttrib = SeriesAttributes.fromJson(jsonData);
      expect(seriesAttrib.toJson(), jsonData);
    });

    test("Store", () async {
      final storeData = File('testData/attributes/storeAttrib.json');
      final jsonData = jsonDecode(await storeData.readAsString());
      StoreAttributes storeAttrib = StoreAttributes.fromJson(jsonData);
      expect(storeAttrib.toJson(), jsonData);
    });
  });

  group("Relationships: ", () {
    test("pointer", () async {
      final pointerData = File('testData/pointer.json');
      final jsonData = jsonDecode(await pointerData.readAsString());
      Pointer pointer = Pointer.fromJson(jsonData);
      expect(pointer.toJson(), jsonData);
    });
  });

  group("Generic Data Model: ", () {
    test("Authors", () async {
      final authorData = File('testData/genericDataModel/authors.json');
      final jsonData = jsonDecode(await authorData.readAsString());
      GenericDataModel<AuthorAttributes> author = GenericDataModel.fromAPI(jsonData);
      expect(author.attributes!.name, "Nettie McCullough");
      expect(author.attributes!.birthplace, "Guatemala");
      expect(author.attributes!.dob, "2015-11-21");
      expect(author.attributes!.dod, "2021-01-13");
      expect(author.type.stringVal, "authors");
      expect(author.getPointer(ofType: DataType.photos)![0].id, '1');
      expect(author.getPointer(ofType: DataType.books)![0].id, '13');
      expect(author.id, '1');
    });

    test("Books", () async {
      final bookData = File('testData/genericDataModel/books.json');
      final jsonData = jsonDecode(await bookData.readAsString());
      GenericDataModel<BookAttributes> book = GenericDataModel.fromAPI(jsonData);
      expect(book.attributes!.isbn, 4294967295);
      expect(book.attributes!.datePublished, "1972-06-15");
      expect(book.getPointer(ofType: DataType.chapters), []);
    });
  });

  group("DataType: ", () {
    Map<DataType, String> dataTypes = {
      DataType.author: "author",
      DataType.authors: "authors",
      DataType.book: "book",
      DataType.books: "books",
      DataType.chapters: "chapters",
      DataType.countries: "countries",
      DataType.photos: "photos",
      DataType.series: "series",
      DataType.stores: "stores",
    };

    test("Serialization / Deserialization", () {
      dataTypes.forEach((type, string) {
        expect(DataTypeExtension.tryParse(string), type, reason: "Failed parsing");
        expect(type.stringVal, string, reason: "Failed returning string value");
      });
    });
  });

  group("GenericDataModel: ", () {
    test("multi-pointer", () async {
      final genData = File('testData/genericDataModel.json');
      final jsonData = jsonDecode(await genData.readAsString());
      Store book = Store.fromAPI(jsonData);
      expect(book.attributes!.address, "65346 Volkman Divide Suite 708");
    });
  });
}
