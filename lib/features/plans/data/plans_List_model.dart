import 'package:equatable/equatable.dart';

const String _disclamer = 'disclamer';
const String _plans = 'plans';

const String _identifier = 'identifier';
const String _packageType = 'packageType';
const String _product = 'product';
const String _offeringIdentifier = 'offeringIdentifier';

const String _description = 'description';
const String _title = 'title';
const String _price = 'price';
const String _priceString = 'priceString';
const String _currencyCode = 'currencyCode';
const String _introPrice = 'introPrice';
const String _discounts = 'discounts';
const String _isPopular = 'isPopular';
const String _isPro = 'isPro';
const String _subscriptionPeriod = 'subscriptionPeriod';
const String _benefits = 'benefits';

class PlansListModel extends Equatable{
  String? disclamer;
  List<Plans>? plans;

  PlansListModel({this.disclamer, this.plans});

  PlansListModel.fromJson(Map<String, dynamic> json) {
    disclamer = json[_disclamer];
    if (json[_plans] != null) {
      plans = <Plans>[];
      json[_plans].forEach((v) {
        plans!.add(new Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[_disclamer] = this.disclamer;
    if (this.plans != null) {
      data[_plans] = this.plans!.map((v) => v.toJson()).toList();
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
    identifier = json[_identifier];
    packageType = json[_packageType];
    product =
    json[_product] != null ? new Product.fromJson(json[_product]) : null;
    offeringIdentifier = json[_offeringIdentifier];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[_identifier] = this.identifier;
    data[_packageType] = this.packageType;
    if (this.product != null) {
      data[_product] = this.product!.toJson();
    }
    data[_offeringIdentifier] = this.offeringIdentifier;
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
    identifier = json[_identifier];
    description = json[_description];
    title = json[_title];
    price = json[_price];
    priceString = json[_priceString];
    currencyCode = json[_currencyCode];
    introPrice = json[_introPrice];
    discounts = json[_discounts];
    isPopular = json[_isPopular];
    isPro = json[_isPro];
    subscriptionPeriod = json[_subscriptionPeriod];
    benefits = json[_benefits].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[_identifier] = this.identifier;
    data[_description] = this.description;
    data[_title] = this.title;
    data[_price] = this.price;
    data[_priceString] = this.priceString;
    data[_currencyCode] = this.currencyCode;
    data[_introPrice] = this.introPrice;
    data[_discounts] = this.discounts;
    data[_isPopular] = this.isPopular;
    data[_isPro] = this.isPro;
    data[_subscriptionPeriod] = this.subscriptionPeriod;
    data[_benefits] = this.benefits;
    return data;
  }
}
