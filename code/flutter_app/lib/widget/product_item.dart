import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/classes/product_class.dart';

class ProductItem extends StatelessWidget{
  const ProductItem({super.key, required this.product});

  final ProductClass product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: product.stock > 0? Colors.blueGrey : Colors.redAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image(
                  image: NetworkImage(product.pictureURI),
                opacity: product.stock > 0 ? const AlwaysStoppedAnimation(1) : const AlwaysStoppedAnimation(0.3),
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0/4),
          child: Text(
            utf8.decode(product.productName.codeUnits),
            style: const TextStyle(color: Color(0xFFACACAC)),
          ),
        ),
        Text(
          "${product.price} €",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          product.stock > 0? "Stock: ${product.stock}" : "Stock: Epuisé",
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

}