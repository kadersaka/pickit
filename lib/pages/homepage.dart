import 'package:flutter/material.dart';
import 'package:pickit/pages/delivery/delivery_info.dart';
import 'package:pickit/pages/my_notifications.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pickit/utils/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pickit/pages/restaurant_delivery.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(CustomTextStyle().fixPadding),
              width: width - (CustomTextStyle().fixPadding * 2.0),
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(10.0),
//                image: DecorationImage(
//                  image: AssetImage('assets/banner.png'),
//                  fit: BoxFit.fill,
//                ),
//                child: Lottie.asset('assets/lotties/alert.json'),
//              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 175.0,
                  enableInfiniteScroll: true,
//                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 500),
                  autoPlayCurve: Curves.fastOutSlowIn,
  //                enlargeStrategy: CenterPageEnlargeStrategy.height
                ),
                items: [
                  Lottie.asset('assets/lotties/alert.json'),
                  Lottie.asset('assets/lotties/deliverylocation.json'),
                  Lottie.asset('assets/lotties/deliveryriding.json'),
                ],
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeliveryInfo()));
              },
              child: Hero(
                tag: 'Livraison',
                child: Container(
                  margin: EdgeInsets.only(
                      top: CustomTextStyle().fixPadding * 2.0,
                      right: CustomTextStyle().fixPadding,
                      left: CustomTextStyle().fixPadding
                  ),
                  padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: Theme.of(context).primaryColor.withOpacity(0.4),
                        ),
                        child: Image.asset(
                          'assets/icons/courier.png',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        width: width - (CustomTextStyle().fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('livraison Express', style: Theme.of(context).textTheme.headline4),
                            Text('Partout et à tout moment, un service pour toutes les occasions.', )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RestaurantDelivery()));
              },
              child: Hero(
                tag: 'Restaurants & Fast-food',
                child: Container(
                  margin: EdgeInsets.only(
                      top: CustomTextStyle().fixPadding * 2.0,
                      right: CustomTextStyle().fixPadding,
                      left: CustomTextStyle().fixPadding
                  ),
                  padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: Theme.of(context).primaryColor.withOpacity(0.4),
                        ),
                        child: Image.asset(
                          'assets/icons/food.png',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        width: width - (CustomTextStyle().fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Restaurants & Fast-food', style: Theme.of(context).textTheme.headline4),
                            Text('Commandez dans votre restaurant préféré et nous vous livrons', )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => SendPackages()));
              },
              child: Hero(
                tag: 'Supermarchés & Surfaces',
                child: Container(
                  margin: EdgeInsets.only(
                      top: CustomTextStyle().fixPadding * 2.0,
                      right: CustomTextStyle().fixPadding,
                      left: CustomTextStyle().fixPadding
                  ),
                  padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: Theme.of(context).primaryColor.withOpacity(0.4),
                        ),
                        child: Image.asset(
                          'assets/icons/grocery.png',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        width: width - (CustomTextStyle().fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Supermarchés', style: Theme.of(context).textTheme.headline4),
                            Text('Commandez vos produits dans votre supermarché et nous vous livrons', )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => SendPackages()));
              },
              child: Hero(
                tag: 'Déménagements',
                child: Container(
                  margin: EdgeInsets.only(
                      top: CustomTextStyle().fixPadding * 2.0,
                      right: CustomTextStyle().fixPadding,
                      left: CustomTextStyle().fixPadding
                  ),
                  padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: Theme.of(context).primaryColor.withOpacity(0.4),
                        ),
                        child: Image.asset(
                          'assets/images/movingtruck.png',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        width: width - (CustomTextStyle().fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Déménagements', style: Theme.of(context).textTheme.headline4),
                            Text('Nous Transportons vos colis: en Tricycle, Camionette ou camion', )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),



            SizedBox(height: 50.0,),
            InkWell(
              onTap: () {
//                Navigator.push(
//                    context,
//                    PageTransition(
//                        type: PageTransitionType.scale,
//                        alignment: Alignment.bottomCenter,
//                        child: InviteFriend()));
              },
              child: Container(
                padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/wallet.png',
                          width: 35.0,
                          height: 35.0,
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          width: width - (CustomTextStyle().fixPadding * 4.0 + 35.0 + 30.0 + 10.0),
                          child: Text('Invitez vos amis et gagnez des courses gratuites',),
                        ),
                      ],
                    ),
                    Container(
                      width: 30.0,
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_forward_ios, color: Theme.of(context).textTheme.bodyText1.color, size: 18.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.0,),
          ],
        ),
      )
    );
  }
}
