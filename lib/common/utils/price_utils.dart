class PriceUtils {
  static String formatPrice(int price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  static String formatDiscountedPrice(
      int originalPrice, double discountPercentage) {
    final discountedPrice =
        originalPrice - (originalPrice * discountPercentage / 100);
    return '\$${discountedPrice.toStringAsFixed(2)}';
  }
}
