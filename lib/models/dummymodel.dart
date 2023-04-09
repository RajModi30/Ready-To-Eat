class ProductModel {
  int? id;
  ProductDummy? product;

  ProductModel({this.id, this.product});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new ProductDummy.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ProductModel{id: $id, product: $product}';
  }
}

class ProductDummy {
  String? image;
  String? rate;
  String? name;
  String? category;

  ProductDummy({this.image, this.rate, this.name, this.category});

  ProductDummy.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    rate = json['rate'];
    name = json['name'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['rate'] = this.rate;
    data['name'] = this.name;
    data['category'] = this.category;
    return data;
  }

  @override
  String toString() {
    return 'ProductDummy{image: $image, price: $rate, name: $name, category: $category}';
  }
}