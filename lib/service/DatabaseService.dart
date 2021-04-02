import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_e_service_company/app/Product.dart';

abstract class Database {
  Future<List<Product>> getMyRequestProductData();

  Future sendAcceptedRequest(Product prdt);

  Future sendAssignedRequest(Product prdt);

  Future sendCompleteRequest(Product product);
}

class FireStoreDatabase implements Database {
  FireStoreDatabase({this.uid});

  final String uid;

  Future<List<Product>> getMyRequestProductData() async {
    List<Product> products = List<Product>();
    print(uid);
    final path = '/CompanyUsers/$uid/Requests';
    final documentReference = FirebaseFirestore.instance.collection(path);
    await documentReference
        .orderBy("TimeStamp", descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        Product eachMyProduct = Product(
          Username: element["User Name"],
          Useremail: element["User Email"],
          UserPhone: element["User Phone"],
          UserUid : element["User Uid"],
          title: element["Product"],
          serialNumber: element["Product Serial ID"],
          RequestID: element["RequestId"],
          image: element["Product Image"],
          category: element["Product Category"],
          uploadImage: element["User UploadedImage"],
          Warrnty: element["User Product Warranty"],
          ExtendedWarrnty: element["User Product ExtendedWarranty"],
          timestamp: element["TimeStamp"],
          brand: element["Brand"],
          Attachments: element["Request Attachments"],
          Description: element["Request Description"],
          requestSent: element["Brand Email"],
          completedTimestamp: element["Request Compeleted TimeStamp"],
          CompleletedTask: element["Request Compelete"],
          AcceptedTask: element["Request Status Accepted"],
          AcceptedTimestamp: element["Request Status Accepted TimeStamp"],
          AssignedTask: element["Request Status Assigned"],
          AssignedTimestamp: element["Request Status Assigned TimeStamp"],
          AssignedTechiename: element["Request Status Assigned Person Name"],
          AssignedTechiePhone:
              element["Request Status Assigned Person PhoneNumber"],
        );
        products.add(eachMyProduct);
      });

    });
    return products;
  }

  Future sendAcceptedRequest(Product prdt) async {
    Product prdt1 = new Product();
    String RequID = prdt.RequestID;
    String UserUid = prdt.UserUid;
    final path = '/CompanyUsers/$uid/Requests/$RequID';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.update(
        {
          "Request Status Accepted" : true,
          "Request Status Accepted TimeStamp" : Timestamp.now()
        }
    ).whenComplete(() async {
      print("${UserUid.toString()} and  ${RequID}");
      final path1 = '/EndUsers/users/${UserUid.toString()}/profile/Requests/$RequID';
      final documentReference1 = FirebaseFirestore.instance.doc(path1);
      await documentReference1.update(
          {
            "Request Status Accepted" : true,
            "Request Status Accepted TimeStamp" : Timestamp.now()
          }
      ).catchError((onError) {
        print(onError.toString());
      }).whenComplete(()
          async {
            final path = '/CompanyUsers/$uid/Requests/$RequID';
            final documentReference = FirebaseFirestore.instance.doc(path);
            await documentReference.get().then((value) {
              prdt1 = Product(
                Username: value.get("User Name"),
                Useremail: value.get("User Email"),
                UserPhone: value.get("User Phone"),
                UserUid : value.get("User Uid"),
                title: value.get("Product"),
                serialNumber: value.get("Product Serial ID"),
                RequestID: value.get("RequestId"),
                image: value.get("Product Image"),
                category: value.get("Product Category"),
                uploadImage: value.get("User UploadedImage"),
                Warrnty: value.get("User Product Warranty"),
                ExtendedWarrnty: value.get("User Product ExtendedWarranty"),
                timestamp: value.get("TimeStamp"),
                brand: value.get("Brand"),
                Attachments: value.get("Request Attachments"),
                Description: value.get("Request Description"),
                requestSent: value.get("Brand Email"),
                completedTimestamp: value.get("Request Compeleted TimeStamp"),
                CompleletedTask: value.get("Request Compelete"),
                AcceptedTask: value.get("Request Status Accepted"),
                AcceptedTimestamp: value.get("Request Status Accepted TimeStamp"),
                AssignedTask: value.get("Request Status Assigned"),
                AssignedTimestamp: value.get("Request Status Assigned TimeStamp"),
                AssignedTechiename: value.get("Request Status Assigned Person Name"),
                AssignedTechiePhone:
                value.get("Request Status Assigned Person PhoneNumber"),
              );
            });
          }
      );
    }).catchError((onError) {
      print(onError.toString());
    });
    return prdt1;
  }


  Future sendAssignedRequest(Product prdt) async {
    Product prdt1 = new Product();
    String RequID = prdt.RequestID;
    String UserUid = prdt.UserUid;
    final path = '/CompanyUsers/$uid/Requests/$RequID';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.update(
        {
          "Request Status Assigned" : true,
          "Request Status Assigned TimeStamp" : Timestamp.now()
        }
    ).whenComplete(() async {
      print("${UserUid.toString()} and  $RequID");
      final path1 = '/EndUsers/users/${UserUid.toString()}/profile/Requests/$RequID';
      final documentReference1 = FirebaseFirestore.instance.doc(path1);
      await documentReference1.update(
          {
            "Request Status Assigned" : true,
            "Request Status Assigned TimeStamp" : Timestamp.now()
          }
      ).catchError((onError) {
        print(onError.toString());
      }).whenComplete(()
      async {
        final path = '/CompanyUsers/$uid/Requests/$RequID';
        final documentReference = FirebaseFirestore.instance.doc(path);
        await documentReference.get().then((value) {
          prdt1 = Product(
            Username: value.get("User Name"),
            Useremail: value.get("User Email"),
            UserPhone: value.get("User Phone"),
            UserUid : value.get("User Uid"),
            title: value.get("Product"),
            serialNumber: value.get("Product Serial ID"),
            RequestID: value.get("RequestId"),
            image: value.get("Product Image"),
            category: value.get("Product Category"),
            uploadImage: value.get("User UploadedImage"),
            Warrnty: value.get("User Product Warranty"),
            ExtendedWarrnty: value.get("User Product ExtendedWarranty"),
            timestamp: value.get("TimeStamp"),
            brand: value.get("Brand"),
            Attachments: value.get("Request Attachments"),
            Description: value.get("Request Description"),
            requestSent: value.get("Brand Email"),
            completedTimestamp: value.get("Request Compeleted TimeStamp"),
            CompleletedTask: value.get("Request Compelete"),
            AcceptedTask: value.get("Request Status Accepted"),
            AcceptedTimestamp: value.get("Request Status Accepted TimeStamp"),
            AssignedTask: value.get("Request Status Assigned"),
            AssignedTimestamp: value.get("Request Status Assigned TimeStamp"),
            AssignedTechiename: value.get("Request Status Assigned Person Name"),
            AssignedTechiePhone:
            value.get("Request Status Assigned Person PhoneNumber"),
          );
        });
      }
      );
    }).catchError((onError) {
      print(onError.toString());
    });
    return prdt1;
  }

  Future sendCompleteRequest(Product prdt) async {
    Product prdt1 = new Product();
    String RequID = prdt.RequestID;
    String UserUid = prdt.UserUid;
    final path = '/CompanyUsers/$uid/Requests/$RequID';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.update(
        {
          "Request Compelete" : true,
          "Request Compeleted TimeStamp" : Timestamp.now()
        }
    ).whenComplete(() async {
      print("${UserUid.toString()} and  $RequID");
      final path1 = '/EndUsers/users/${UserUid.toString()}/profile/Requests/$RequID';
      final documentReference1 = FirebaseFirestore.instance.doc(path1);
      await documentReference1.update(
          {
            "Request Compelete" : true,
            "Request Compeleted TimeStamp" : Timestamp.now()
          }
      ).catchError((onError) {
        print(onError.toString());
      }).whenComplete(()
      async {
        final path = '/CompanyUsers/$uid/Requests/$RequID';
        final documentReference = FirebaseFirestore.instance.doc(path);
        await documentReference.get().then((value) {
          prdt1 = Product(
            Username: value.get("User Name"),
            Useremail: value.get("User Email"),
            UserPhone: value.get("User Phone"),
            UserUid : value.get("User Uid"),
            title: value.get("Product"),
            serialNumber: value.get("Product Serial ID"),
            RequestID: value.get("RequestId"),
            image: value.get("Product Image"),
            category: value.get("Product Category"),
            uploadImage: value.get("User UploadedImage"),
            Warrnty: value.get("User Product Warranty"),
            ExtendedWarrnty: value.get("User Product ExtendedWarranty"),
            timestamp: value.get("TimeStamp"),
            brand: value.get("Brand"),
            Attachments: value.get("Request Attachments"),
            Description: value.get("Request Description"),
            requestSent: value.get("Brand Email"),
            completedTimestamp: value.get("Request Compeleted TimeStamp"),
            CompleletedTask: value.get("Request Compelete"),
            AcceptedTask: value.get("Request Status Accepted"),
            AcceptedTimestamp: value.get("Request Status Accepted TimeStamp"),
            AssignedTask: value.get("Request Status Assigned"),
            AssignedTimestamp: value.get("Request Status Assigned TimeStamp"),
            AssignedTechiename: value.get("Request Status Assigned Person Name"),
            AssignedTechiePhone:
            value.get("Request Status Assigned Person PhoneNumber"),
          );
        });
      }
      );
    }).catchError((onError) {
      print(onError.toString());
    });
    return prdt1;
  }
}
