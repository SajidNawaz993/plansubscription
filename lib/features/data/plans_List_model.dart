import 'package:equatable/equatable.dart';

class PlansListModel extends Equatable{
  String? disclamer;
  List<Plans>? plans;

  PlansListModel({this.disclamer, this.plans});

  PlansListModel.fromJson(Map<String, dynamic> json) {
    disclamer = json['disclamer'];
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(new Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disclamer'] = this.disclamer;
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [disclamer,plans];
}

class Plans {
  String? identifier;
  String? packageType;
  Product? product;
  String? offeringIdentifier;

  Plans(
      {this.identifier,
        this.packageType,
        this.product,
        this.offeringIdentifier});

  Plans.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    packageType = json['packageType'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    offeringIdentifier = json['offeringIdentifier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['packageType'] = this.packageType;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['offeringIdentifier'] = this.offeringIdentifier;
    return data;
  }
}

class Product {
  String? identifier;
  String? description;
  String? title;
  double? price;
  String? priceString;
  String? currencyCode;
  String? introPrice;
  String? discounts;
  bool? isPopular;
  bool? isPro;
  String? subscriptionPeriod;
  List<String>? benefits;

  Product(
      {this.identifier,
        this.description,
        this.title,
        this.price,
        this.priceString,
        this.currencyCode,
        this.introPrice,
        this.discounts,
        this.isPopular,
        this.isPro,
        this.subscriptionPeriod,
        this.benefits});

  Product.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    description = json['description'];
    title = json['title'];
    price = json['price'];
    priceString = json['priceString'];
    currencyCode = json['currencyCode'];
    introPrice = json['introPrice'];
    discounts = json['discounts'];
    isPopular = json['isPopular'];
    isPro = json['isPro'];
    subscriptionPeriod = json['subscriptionPeriod'];
    benefits = json['benefits'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['description'] = this.description;
    data['title'] = this.title;
    data['price'] = this.price;
    data['priceString'] = this.priceString;
    data['currencyCode'] = this.currencyCode;
    data['introPrice'] = this.introPrice;
    data['discounts'] = this.discounts;
    data['isPopular'] = this.isPopular;
    data['isPro'] = this.isPro;
    data['subscriptionPeriod'] = this.subscriptionPeriod;
    data['benefits'] = this.benefits;
    return data;
  }
}
