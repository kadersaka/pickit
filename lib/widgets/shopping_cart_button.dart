import 'package:flutter/material.dart';
//import 'package:minfo/models/cart.dart';
//import 'package:minfo/pages/cart.dart';
//import 'package:minfo/providers/cart_provider.dart';

class ShoppingCartFloatButtonWidget extends StatefulWidget {
  const ShoppingCartFloatButtonWidget({
    this.iconColor,
    this.labelColor,
    this.backColor,
//    this.food,
    Key key,
  }) : super(key: key);

  final Color iconColor;
  final Color labelColor;

  final Color backColor;
//  final Food food;

  @override
  _ShoppingCartFloatButtonWidgetState createState() => _ShoppingCartFloatButtonWidgetState();
}

class _ShoppingCartFloatButtonWidgetState extends State<ShoppingCartFloatButtonWidget> {
//  CartController _con;

//  _ShoppingCartFloatButtonWidgetState() : super(CartController()) {
//    _con = controller;
//  }

//  List<Cart> carts_list = [];
//  final cartProvider = Shift4CartProvider.instance;


  @override
  void initState() {
//    _con.listenForCartsCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 40,
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        color: widget.backColor,
        shape: StadiumBorder(),
        onPressed: () {
//          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => CartWidget()));

        },
        child: FutureBuilder(
            future: Future.value(true),
            builder: (context,  snapshot) {
              if (snapshot.hasData) {
                return cartIconView();
              }
              else {
                return cartIconView();
              }
            }
        ),
      ),
    );
  }
  Widget cartIconView(){
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Icon(
          Icons.shopping_cart,
          color: this.widget.iconColor,
          size: 18,
        ),
        Container(
          child: Text(
            "5" ,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .caption
                .merge(TextStyle(color: Colors.white,
                fontSize: 6,
                fontWeight: FontWeight.bold),),
          ),
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(color: this.widget.labelColor,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          constraints: BoxConstraints(minWidth: 8,
              maxWidth: 8,
              minHeight: 8,
              maxHeight: 8),
        ),
      ],
    );
  }
}
