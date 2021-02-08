import 'package:flutter/material.dart';
import 'package:pickit/utils/constants.dart';
import 'package:pickit/pages/cart_screen.dart';
class SingleRestaurant extends StatefulWidget {
  @override
  _SingleRestaurantState createState() => _SingleRestaurantState();
}

class _SingleRestaurantState extends State<SingleRestaurant> {

  bool vegOnly = false;

  bool option1 = false;
  bool option2 = false;
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
  final itemListData = [
    {
      'name': 'BRIOCHE',
      'desc': 'la France débarque avec la brioche normande, dodue et dorée. ',
      'type': 'veg',
      'price': '4000'
    },
    {
      'name': 'LASAGNES',
      'desc': 'l\’Italie prouve une nouvelle fois qu\’elle est bien intégrée dans le cœur des gourmands grâce aux lasagnes qui cumulent avec deux expressions',
      'type': 'veg',
      'price': '5000'
    },
    {
      'name': 'CRÊPES',
      'desc': 'Qu’elles soient salées ou sucrées, les fameuses crêpes qui s’adaptent à tous les goûts séduisent encore et toujours',
      'type': 'nonveg',
      'price': '6000'
    },
    {
      'name': 'GNOCCHIS',
      'desc': 'Originaires d’Emilie-Romagne en Italie, ces petites boules de pâte à base de purée de pommes de terre',
      'type': 'veg',
      'price': '3500'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(175.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: CustomTextStyle().fixPadding * 2.0,
                    left: CustomTextStyle().fixPadding * 2.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Le Luxxe bar à vin',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        'Cotonou route des pêches',
//                        style: greySmallTextStyle,
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.timer, size: 18.0),
                          SizedBox(width: 3.0),
                          Text(
                            'Livraison en 78 mins en moyenne',
//                            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.black87))
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.local_offer,
                              color: Theme.of(context).accentColor, size: 18.0),
                          SizedBox(width: 3.0),
                          Text('Livraison Gratuite à partir de 5000F CFA',
                            style: TextStyle(color: Theme.of(context).accentColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0,)

                    ],
                  ),
                ),
                Container(
                  child: TabBar(
                    indicatorColor:Theme.of(context).primaryColor,
                    indicatorPadding: EdgeInsets.only(right: 15.0, left: 15.0),
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'Fast-food'.toUpperCase()),
                      Tab(text: 'Café'.toUpperCase()),
                      Tab(text: 'Dessert'.toUpperCase()),
                      Tab(text: 'Local'.toUpperCase()),
                      Tab(text: 'Européen'.toUpperCase()),
                      Tab(text: 'Boissons'.toUpperCase()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            itemList(),
            itemList(),
            itemList(),
            itemList(),
            itemList(),
            itemList(),
          ],
        ),
      ),
    );
  }

  itemList() {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: itemListData.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final item = itemListData[index];
        return Container(
          width: width,
          margin: (index == 0)
              ? EdgeInsets.all(CustomTextStyle().fixPadding * 2.0)
              : EdgeInsets.only(
              right: CustomTextStyle().fixPadding * 2.0,
              left: CustomTextStyle().fixPadding * 2.0,
              bottom: CustomTextStyle().fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 26.0,
                height: 26.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0,
                      color:
                      (item['type'] == 'veg') ? Colors.green : Colors.red),
                ),
                child: Container(
                  width: 16.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color:
                      (item['type'] == 'veg') ? Colors.green : Colors.red),
                ),
              ),
              SizedBox(width: 10.0,),
              Container(
                width: width - (CustomTextStyle().fixPadding * 4.0 + 26.0 + 10.0 + 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
//                      style: blackLargeTextStyle,
                    ),
                    Text(
                      item['desc'],
//                      style: greySmallTextStyle,
                    ),
                    Text(
                      '${item['price']} F CFA',
//                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                width: 100.0,
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => _addToCartBottomSheet(context),
                  child: Container(
                    width: 80.0,
                    padding: EdgeInsets.all(CustomTextStyle().fixPadding * 0.8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 0.5, color: Colors.grey[200]),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          color: Colors.grey[300],
                        )
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(' AJOUTER', ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
 Widget cart() {
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
                      '5.000 F CFA',
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

  void _addToCartBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          double width = MediaQuery.of(context).size.width;
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/customize.png',
                          width: 70.0,
                          height: 70.0,
                          fit: BoxFit.fitWidth,
                        ),
                        IconButton(
                          icon:
                          Icon(Icons.close, size: 22.0),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  cart(),
                  Material(
                    elevation: 7.0,
                    child: Container(
                      width: width,
                      padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*;
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Bold - Cocoa',
                              ),
                              Text(
                                '+1 more',
                              ),
                            ],
                          ),
                          */
                          SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Item Total',
//                                    style: blackHeadingTextStyle,
                                  ),
                                  SizedBox(width: 5.0),
                                  Container(
                                    width: 10.0,
                                    height: 10.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    '5.000 F CFA',
//                                    style: priceTextStyle,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartScreen()));
                                },
                                child: Container(
                                  width: 120.0,
                                  padding: EdgeInsets.all(CustomTextStyle().fixPadding * 0.6),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color:Theme.of(context).primaryColor,
                                  ),
                                  child: Text(
                                    'Add Item',
//                                    style: whiteBottonTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}
