import 'package:flutter/material.dart';
import 'package:pickit/utils/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pickit/pages/payment_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int number = 1;
  increamentNumber() {
    setState(() {
      number = number + 1;
    });
  }

  decreamentNumber() {
    if (number == 1) {
    } else {
      setState(() {
        number = number - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0.5,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirmation de la commande',
              
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Bar 61 Restaurant, 76A England',
              style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(color: Colors.black38)),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 15.0,
        child: Container(
          height: 180.0,
//          color: whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 34.0,
                      height: 34.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Icon(
                        Icons.location_on,
//                        color: whiteColor,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      width: width - (CustomTextStyle().fixPadding * 4.0 + 10.0 + 34.0 + 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Livré à',
//                                style: greySmallBoldTextStyle,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                'Bureau',
                              ),
                            ],
                          ),
                          Text(
                              'Lot 34, Maison Tchibozo, Tokplégbé, Cotonou',
                              overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 30.0,
                        child: Icon(
                          Icons.edit,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                height: 1.2,
                color: Colors.grey[200],
              ),
              Container(
                padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('1 Produit',),
                        SizedBox(width: 10.0),
                        Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text('7.000 F CFA',),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: PaymentScreen(),
                            )
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            right: CustomTextStyle().fixPadding * 4.0,
                            left: CustomTextStyle().fixPadding * 4.0,
                            top: CustomTextStyle().fixPadding,
                            bottom: CustomTextStyle().fixPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          'Payer',
//                          style: whiteBottonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          // Item List Start
          itemList(),
          // Item List End
          blankSpace(),
          // Invoice Start
          invoice(),
          // Invoice End
        ],
      ),
    );
  }

  itemList() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.store, size: 18.0),
              SizedBox(width: 5.0),
              Text('Produits',),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 18.0,
                      height: 18.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.green),
                      ),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.green),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      width:
                      ((width - (CustomTextStyle().fixPadding * 6.0)) / 2.0) - (18.0 + 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lasagne',
                          ),
//                          SizedBox(height: 20.0,),
                          /*
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(CustomTextStyle().fixPadding),
                              decoration: BoxDecoration(
//                                color: whiteColor,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    width: 0.2,
                                    color: Colors.grey.withOpacity(0.6)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Customize',
//                                    style: greyNormalTextStyle,
                                  ),
                                  SizedBox(width: 5.0),
                                  Icon(Icons.keyboard_arrow_down, size: 20.0,),
                                ],
                              ),

                            ),
                          ),
                          */
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: (width - (CustomTextStyle().fixPadding * 8.0)) / 2.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(CustomTextStyle().fixPadding),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 0.2, color: Theme.of(context).primaryColor.withOpacity(0.6)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              decreamentNumber();
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 22.0,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '$number',
//                            style: Theme.of(context).primaryColorSmallTextStyle,
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              increamentNumber();
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 22.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$15',
//                      style: blackLargeTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  blankSpace() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: CustomTextStyle().fixPadding * 2.0,
      color: Colors.grey[100],
    );
  }

  thinDivider() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width - CustomTextStyle().fixPadding * 4.0,
      height: 1.5,
      color: Colors.grey[100],
    );
  }

  invoice() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invoice',
//            style: blackLargeTextStyle,
          ),
          SizedBox(height: 10.0,),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Item total',

              ),
              Text(
                '\$15',
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          thinDivider(),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Partner Delivery Charges',

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$1',
//                    style: Theme.of(context).primaryColorLignThroughSmallBoldTextStyle,
                  ),
//                  SizedBox(width: 10.0),
                  Text(
                    '\$0.7',
//                    style: Theme.of(context).primaryColorSmallBoldTextStyle,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          thinDivider(),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Offer discount',
//                style: Theme.of(context).primaryColorSmallBoldTextStyle,
              ),
              Text(
                '-\$1',
//                style: Theme.of(context).primaryColorSmallBoldTextStyle,
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          thinDivider(),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Grand total',

              ),
              Text(
                '\$14.7',
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          thinDivider(),
          SizedBox(height: 10.0,),
          Container(
            padding: EdgeInsets.all(CustomTextStyle().fixPadding * 0.5),
            width: width - CustomTextStyle().fixPadding * 4.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
            ),
            child: Text(
              'Congratulations! You\'ve saved \$1.3 on this order.',
//              style: Theme.of(context).primaryColorSmallBoldTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
