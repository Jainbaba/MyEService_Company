import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String image,
      title,
      brand,
      category,
      RequestID,
      Description,
      requestSent;
  final String UserUid, Username, UserPhone, Useremail;
  final List<dynamic> Attachments;
  final bool Warrnty, CompleletedTask, AssignedTask, AcceptedTask;
  final String serialNumber,
      uploadImage,
      ExtendedWarrnty,
      AssignedTechiename,
      AssignedTechiePhone;
  final Timestamp timestamp,
      completedTimestamp,
      AssignedTimestamp,
      AcceptedTimestamp;

  Product({
    this.Username,
    this.UserPhone,
    this.Useremail,
    this.AssignedTask,
    this.AcceptedTask,
    this.AssignedTechiename,
    this.AssignedTechiePhone,
    this.AssignedTimestamp,
    this.AcceptedTimestamp,
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
    this.UserUid,
    this.brand,
    this.image,
    this.title,
  });

}
