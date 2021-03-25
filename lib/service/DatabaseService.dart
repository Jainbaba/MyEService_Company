import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_e_service_company/app/Product.dart';

abstract class Database {
  Future<List<Product>> getMyRequestProductData();
}

class FireStoreDatabase implements Database {

  FireStoreDatabase({this.uid});

  final String uid;

  // ignore: missing_return
  Future<List<Product>> getMyRequestProductData() async {
    List<Product> products = List<Product>();
    print(uid);
    final path = '/CompanyUsers/$uid/Requests';
    final documentReference = FirebaseFirestore.instance.collection(path);
    await documentReference
        .get()
        .then((value) {
          value.docs.forEach((element) {
            //print(element.get("Request Compelete"));
            if(!element.get("Request Compelete")){
              Product eachMyProduct = Product(
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
                  UserName: element["User Name"],
                  UserEmail: element["User Email"],
                  UserPhone: element["User Phone"]);
              products.add(eachMyProduct);
            }
            /*Map<dynamic, dynamic> productData =
            Map<dynamic, dynamic>.from(element.data() as Map<dynamic, dynamic>);*/
          });

     /* value.forEach((element) async {
        Product eachMyProduct = Product(
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
            UserName: element["User Name"],
            UserEmail: element["User Email"],
            UserPhone: element["User Phone"]);
        products.add(eachMyProduct);
      });*/
    });
    return products;
    //return (products);
  }
}
