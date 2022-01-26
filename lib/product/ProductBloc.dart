import 'package:illustrare/components/BaseBloc.dart';
import 'package:illustrare/product/ProductModel.dart';
import 'package:illustrare/product/ProductRepository.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc extends BaseBloc {

  ProductBloc() {
    this.authRequired = false;
  }

  final ProductRepository _repository = ProductRepository();
  final BehaviorSubject<ProductModel> _subject = BehaviorSubject<ProductModel>();

  getProduct(int productId) async {
    ProductModel? response = await _repository.getProduct(productId);
    _subject.sink.add(response!);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ProductModel> get subject => _subject;

}
final productBloc = ProductBloc();