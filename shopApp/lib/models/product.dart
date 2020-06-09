class Product {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final bool isFavourite;

  Product(
      {this.title,
      this.id,
      this.description,
      this.imageUrl,
      this.price,
      this.isFavourite});
}
