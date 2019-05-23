import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Product{
    final String title;//商品标题
    final String description;//描述

    Product(this.title,this.description);
}

void main(){
    runApp(MaterialApp(
        title: '导航1',
        home:ProductList(
            products:List.generate(
                20, 
                (i)=>Product('666商品 $i','这是一个详情,编号$i')
            ),
        )
        ),
    );
}


class ProductList extends StatelessWidget {

  final List<Product> products;
  ProductList({Key key,@required this.products}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("商品列表"),
            
        ),
        body:ListView.builder(
            itemCount: products.length,
            itemBuilder: (context,index){
                return ListTile(
                    title: Text(products[index].title),
                    onTap: (){
                        Navigator.push(context, 
                            MaterialPageRoute(
                                builder: (context)=>ProductDetail(product:products[index])
                            )
                        );
                    },
                );
            },
        )
    );
  }
}

class ProductDetail extends StatelessWidget {

    final Product product;

    ProductDetail({Key key,@required this.product}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('商品详情')),
        body: Center(
            child: Text('${product.description}'),
        ),
    );
  }
}