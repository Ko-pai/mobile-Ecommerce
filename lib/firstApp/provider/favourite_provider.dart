
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testp/firstApp/model/products.dart';

class FavouriteProvider extends ChangeNotifier{
  final List<Product>  _favourite = [];

  List<Product> get favourite => _favourite;

  void toggleFavourite(Product product){
    
    if(favourite.contains(product)){
      favourite.remove(product);
    }else{
      favourite.add(product);
    }

    notifyListeners();
  }

  bool isExist (Product product){
    final isExist = favourite.contains(product);
    return isExist;
  }

  static FavouriteProvider of(BuildContext context,{
    bool listen = true
  }){
    return Provider.of<FavouriteProvider>(context,listen: listen);
  }
}