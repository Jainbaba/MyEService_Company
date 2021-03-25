import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String image,
      title,
      brand,
      category,
      RequestID,
      Description,
      requestSent;
  final String UserName, UserPhone, UserEmail;
  final List<dynamic> Attachments;
  final bool Warrnty, CompleletedTask;
  final String serialNumber, uploadImage, ExtendedWarrnty;
  final Timestamp timestamp, completedTimestamp;

  Product({
    this.UserName,
    this.UserPhone,
    this.UserEmail,
    this.completedTimestamp,
    this.CompleletedTask,
    this.requestSent,
    this.Attachments,
    this.Description,
    this.RequestID,
    this.ExtendedWarrnty,
    this.Warrnty,
    this.category,
    this.timestamp,
    this.serialNumber,
    this.uploadImage,
    this.brand,
    this.image,
    this.title,
  });

  toJson() {
    return {
      "title": title,
      "image": image,
      "brand": brand,
      "category": category,
      "warranty": Warrnty,
    };
  }
}
