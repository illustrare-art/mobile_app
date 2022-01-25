import 'package:illustrare/network/IllustrareService.dart';
import 'ProductModel.dart';

class ProductRepository{
  IllustrareService _service = IllustrareService();

  Future<ProductModel> getProduct(int productId){
    return _service.getProduct(productId);
  }
}