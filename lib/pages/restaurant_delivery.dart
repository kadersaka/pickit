import 'package:flutter/material.dart';
import 'package:pickit/utils/constants.dart';
import 'package:pickit/pages/single_restaurant.dart';
import 'package:pickit/widgets/shopping_cart_button.dart';
class RestaurantDelivery extends StatefulWidget {
  @override
  _RestaurantDeliveryState createState() => _RestaurantDeliveryState();
}

class _RestaurantDeliveryState extends State<RestaurantDelivery> {
  final restaurantsList = [
    {
      'title': 'Bar 61 Restaurant',
      'type': 'Beverages, Snacks',
      'address': '76A England',
      'image': 'assets/restaurant/restaurant_5.png',
      'time': '15 mins',
      'deliverey': 'Free Delivery',
      'offer': '20% off upto \$2'
    },
    {
      'title': 'Core by Clare Smyth',
      'type': 'Beverages, Fast Food',
      'address': '220 Opera Street',
      'image': 'assets/restaurant/restaurant_4.png',
      'time': '20 mins',
      'deliverey': '',
      'offer': ''
    },
    {
      'title': 'Amrutha Lounge',
      'type': 'Full Meal',
      'address': '90B Silicon Velley',
      'image': 'assets/restaurant/restaurant_3.png',
      'time': '25 mins',
      'deliverey': 'Free Delivery',
      'offer': '25% off on order above \$5'
    },
    {
      'title': 'The Barbary',
      'type': 'Desserts',
      'address': '99C OBC Area',
      'image': 'assets/restaurant/restaurant_2.png',
      'time': '28 mins',
      'deliverey': 'Free Delivery',
      'offer': '20% off upto \$3'
    },
    {
      'title': 'The Palomar',
      'type': 'American Fastfood',
      'address': '31A Om Colony',
      'image': 'assets/restaurant/restaurant_1.png',
      'time': '15 mins',
      'deliverey': 'Free Delivery',
      'offer': '15% off upto \$5'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Hero(
      tag: 'Restaurants',
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          titleSpacing: 0.0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Restaurants', ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            ShoppingCartFloatButtonWidget(
              iconColor: Colors.white,
              labelColor: Theme.of(context).hintColor,
              backColor: Theme.of(context).hintColor,

            ),
          ],
        ),
        body: ListView.builder(
          itemCount: restaurantsList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final item = restaurantsList[index];
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SingleRestaurant()));
              },
              child: Container(
                width: width,
                margin: (index == 0)
                    ? EdgeInsets.all(CustomTextStyle().fixPadding * 2.0)
                    : EdgeInsets.only(
                    right: CustomTextStyle().fixPadding * 2.0,
                    left: CustomTextStyle().fixPadding * 2.0,
                    bottom: CustomTextStyle().fixPadding * 2.0),
                padding: EdgeInsets.all(CustomTextStyle().fixPadding),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      item['image'],
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      width: (width - (CustomTextStyle().fixPadding * 6.0 + 10.0 + 100.0)),
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: 10.0,),
                          Text(item['type'],
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(height: 10.0,),
                          Text(item['address'],
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.timer, size: 18.0, color: Theme.of(context).primaryColor,),
                              SizedBox(width: 5.0),
                              Text(
                                (item['deliverey'] != '')
                                    ? '${item['time']}, ${item['deliverey']}'
                                    : '${item['time']} delivery',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                          (item['offer'] != '')
                              ? SizedBox(height: 5.0)
                              : Container(),
                          (item['offer'] != '')
                              ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.local_offer,
                                  color: Theme.of(context).accentColor, size: 18.0),
                              SizedBox(width: 5.0),
                              Text(
                                item['offer'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Theme.of(context).accentColor),
                              ),
                            ],
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
