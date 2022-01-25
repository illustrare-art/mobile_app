import 'package:illustrare/network/IllustrareService.dart';
import 'ProductModel.dart';

class ProductRepository{
  IllustrareService _service = IllustrareService();

  Future<ProductModel> getProduct(){
    return _service.getProduct();
  }
}