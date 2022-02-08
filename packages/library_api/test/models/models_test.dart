import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:library_api/src/models/models.dart';

void main() {
  group("Attributes: ", () {
    test("Authors", () async {
      final authorData = File('testData/attributes/author.json');
      final jsonData = jsonDecode(await authorData.readAsString());
      Author authorAttrib = Author.fromJson(jsonData);
      expect(authorAttrib.name, "Prof. Antonio Heaney");
      expect(authorAttrib.birthplace, "Micronesia");
      expect(authorAttrib.dob, "2011-09-15");
      expect(authorAttrib.dod, "2014-11-05");
      expect(authorAttrib.getPointer(ofType: DataType.photos)![0].id, "1");
      expect(authorAttrib.getPointer(ofType: DataType.books), []);
    });

    test("Books", () async {
      final bookData = File('testData/attributes/bookAttrib.json');
      final jsonData = jsonDecode(await bookData.readAsString());
      Book book = Book.fromJson(jsonData);
      expect(book.title, "O'Reilly, Deckow and Glover");
      expect(book.datePublished, "1989-01-11");
      expect(book.isbn, 4294967295);
      expect(book.getPointer(ofType: DataType.authors)?[0].id, "47");
      expect(book.getPointer(ofType: DataType.photos)?[0].id, "151");
    });

    test("Chapter", () async {
      final chapterData = File('testData/attributes/chapterAttrib.json');
      final jsonData = jsonDecode(await chapterData.readAsString());
      Chapter chapter = Chapter.fromJson(jsonData);
      expect(chapter.title, "Chapter 328");
      expect(chapter.ordering, 1331102);
      expect(chapter.getPointer(ofType: DataType.books)!.last.id, "16");
    });

    test("Country", () async {
      final countryData = File('testData/attributes/countryAttrib.json');
      final jsonData = jsonDecode(await countryData.readAsString());
      Country country = Country.fromJson(jsonData);
      expect(country.name, "Argentina");
      expect(country.id, "AR");
    });

    test("Photo", () async {
      final photoData = File('testData/attributes/photoAttrib.json');
      final jsonData = jsonDecode(await photoData.readAsString());
      Photo photo = Photo.fromJson(jsonData);
      expect(photo.title, "Photo 954");
      expect(photo.uri, "https://picsum.photos/id/130/400/300.jpg");
    });

    test("Series", () async {
      final seriesData = File('testData/attributes/seriesAttrib.json');
      final jsonData = jsonDecode(await seriesData.readAsString());
      Series series = Series.fromJson(jsonData);
      expect(series.title, "Series 4221170");
      expect(series.getPointer(ofType: DataType.photos)!.last.id, "102");
    });

    test("Store", () async {
      final storeData = File('testData/attributes/storeAttrib.json');
      final jsonData = jsonDecode(await storeData.readAsString());
      Store store = Store.fromJson(jsonData);
      expect(store.name, "Store 417");
      expect(store.address, "65346 Volkman Divide Suite 708");
      expect(store.createdBy, 3);
      expect(store.getPointer(ofType: DataType.books)!.last.id, "27");
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
}
