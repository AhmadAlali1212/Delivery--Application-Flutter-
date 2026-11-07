class OrdersModel {
  int? ordersId;
  int? ordersUserid;
  int? ordersAddressid;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  int? ordersCouponid;
  String? ordersDatetime;
  int? ordersPaymentmethod;
  int? ordersTotalprice;
  int? ordersStatus;
  int? ordersRating;
  String? ordersCommet;
  int? addressId;
  int? addressUserid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressBuilding;
  String? addressName;

  OrdersModel({
    this.ordersId,
    this.ordersUserid,
    this.ordersAddressid,
    this.ordersType,
    this.ordersPricedelivery,
    this.ordersPrice,
    this.ordersCouponid,
    this.ordersDatetime,
    this.ordersPaymentmethod,
    this.ordersTotalprice,
    this.ordersStatus,
    this.ordersRating,
    this.ordersCommet,
    this.addressId,
    this.addressUserid,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressBuilding,
    this.addressName,
  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddressid = json['orders_addressid'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersCouponid = json['orders_couponid'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersTotalprice = json['orders_totalprice'];
    ordersStatus = json['orders_status'];
    ordersRating = json['orders_rating'];
    ordersCommet = json['orders_commet'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressBuilding = json['address_building'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_userid'] = ordersUserid;
    data['orders_addressid'] = ordersAddressid;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_couponid'] = ordersCouponid;
    data['orders_datetime'] = ordersDatetime;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_status'] = ordersStatus;
    data['orders_rating'] = ordersRating;
    data['orders_commet'] = ordersCommet;
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_building'] = addressBuilding;
    data['address_name'] = addressName;
    return data;
  }
}
