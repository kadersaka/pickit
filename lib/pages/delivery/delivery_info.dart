import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;
import 'package:page_transition/page_transition.dart';
import 'package:pickit/utils/constants.dart';
import 'package:pickit/widgets/route_map.dart';
import 'package:pickit/pages/payment_screen.dart';
class DeliveryInfo extends StatefulWidget {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _DeliveryInfoState createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends State<DeliveryInfo> {
  /// For Screens
  bool packageTypeScreen = true;
  bool packageSizeWeightScreen = false;
  bool selectPickUpAddressScreen = false;
  bool selectDeliveryAddressScreen = false;
  bool confirmScreen = false;

  /// For Package Type
  bool documents = false, parcel = false;

  /// For Package Size and Weight Screen
  bool height = false, widthInput = false, depth = false, weight = false;
  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final depthController = TextEditingController();
  final weightController = TextEditingController();

  /// For Pickup Address Screen
  PickResult selectedPickupPlace;
  final pickupAddressController = TextEditingController();
  bool pickupAddress = false;

  /// For Delivery Address Screen
  PickResult selectedDeliveryPlace;
  final deliveryAddressController = TextEditingController();
  bool deliveryAddress = false;

  /// Calculate Distance Between two Locations
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p) / 2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return (12742 * asin(sqrt(a)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Hero(
      tag: 'Send Packages',
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          titleSpacing: 0.0,
          title: Text(
              (packageTypeScreen)
                  ? 'Type de paquet'
                  : (packageSizeWeightScreen)
                  ? 'Taille du paquet'
                  : (selectPickUpAddressScreen)
                  ? 'Addresse de récupération'
                  : (selectDeliveryAddressScreen)
                  ? 'Addresse de livraison'
                  : (confirmScreen) ? 'Confirmation' : '',
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: (packageTypeScreen)
                  ? selectPackageTypeScreen()
                  : (packageSizeWeightScreen)
                  ? enterPackageSizeWeightScreen()
                  : (selectPickUpAddressScreen)
                  ? selectPickupAddressScreenCode()
                  : (selectDeliveryAddressScreen)
                  ? selectDeliveryAddressScreenCode()
                  : (confirmScreen)
                  ? confirmScreenCode()
                  : Container(),
            ),
            Container(
              width: width,
              height: 85.0,
              alignment: Alignment.center,
              padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (packageTypeScreen) ? Container() : backButton(),
                  continueButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  selectPackageTypeScreen() {
    double width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // For Document Start
              InkWell(
                onTap: () {
                  setState(() {
                    documents = true;
                    parcel = false;
                  });
                },
                child: Container(
                  width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
                  child: Column(
                    children: [
                      Container(
                        width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
                        padding: EdgeInsets.only(
                            top: CustomTextStyle().fixPadding * 2.0, bottom: CustomTextStyle().fixPadding * 2.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                              width: 0.8,
                              color: (documents)
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.withOpacity(0.2)
                          ),
                        ),
                        child: Container(
                          width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
                          padding: EdgeInsets.only(right: CustomTextStyle().fixPadding * 2.0),
                          height: 170.0,
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                              AssetImage('assets/icons/document_type.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          child: Container(
                            width: 26.0,
                            height: 26.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (documents) ? Theme.of(context).primaryColor : Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(13.0),
                              border: Border.all(
                                  width: 1.0,
                                  color:
                                  (documents) ? Theme.of(context).primaryColor : Colors.grey.withOpacity(0.2)),
                            ),
                            child: Icon(Icons.check,
                                color: (documents) ? Theme.of(context).scaffoldBackgroundColor : Colors.grey.withOpacity(0.2),
                                size: 18.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Text(
                        'Documents',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
              ),
              // For Document End

              // For Parcel Start
              InkWell(
                onTap: () {
                  setState(() {
                    documents = false;
                    parcel = true;
                  });
                },
                child: Container(
                  width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
                  child: Column(
                    children: [
                      Container(
                        width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
                        padding: EdgeInsets.only(
                            top: CustomTextStyle().fixPadding * 2.0, bottom: CustomTextStyle().fixPadding * 2.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                              width: 0.8,
                              color: (parcel)
                                  ? Theme.of(context).primaryColor : Colors.grey.withOpacity(0.2)),
                        ),
                        child: Container(
                          width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
                          padding: EdgeInsets.only(right: CustomTextStyle().fixPadding * 2.0),
                          height: 170.0,
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/parcel_type.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          child: Container(
                            width: 26.0,
                            height: 26.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (parcel) ?Theme.of(context).primaryColor : Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(13.0),
                              border: Border.all(
                                  width: 1.0,
                                  color: (parcel) ? Theme.of(context).primaryColor : Colors.grey.withOpacity(0.2)),
                            ),
                            child: Icon(Icons.check,
                                color: (parcel) ?Theme.of(context).scaffoldBackgroundColor : Colors.grey.withOpacity(0.2),
                                size: 18.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Text(
                        'Colis',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
              ),
              // For Parcel End
            ],
          ),
        ),
      ],
    );
  }

  ///
  enterPackageSizeWeightScreen() {
    double width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Height Start
              Text('Longueur', style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 10.0,),
              Container(
                width: width - (CustomTextStyle().fixPadding * 4.0),
                height: 50.0,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border:
                  Border.all(width: 0.8, color: Colors.grey.withOpacity(0.6)),
                ),
                child: TextField(
//                  style: inputTextStyle,
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  decoration: InputDecoration(
                    hintText: 'Longueur du packet en cm',
//                    hintStyle: inputTextStyle,
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (v) {
                    if (heightController.text != '') {
                      setState(() {
                        height = true;
                      });
                    } else {
                      setState(() {
                        height = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 10.0,),
              Text('Longueur en cm', ),
              // Height End
              SizedBox(height: 20.0,),
              // Width Start
              Text('Largeur', style: Theme.of(context).textTheme.headline5),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: width - (CustomTextStyle().fixPadding * 4.0),
                height: 50.0,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border:
                  Border.all(width: 0.8, color: Colors.grey.withOpacity(0.6)),
                ),
                child: TextField(
//                  style: inputTextStyle,
                  keyboardType: TextInputType.number,
                  controller: widthController,
                  decoration: InputDecoration(
                    hintText: 'Veuillez entrer la largeur cm',
//                    hintStyle: inputTextStyle,
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (v) {
                    if (widthController.text != '') {
                      setState(() {
                        widthInput = true;
                      });
                    } else {
                      setState(() {
                        widthInput = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Largeur en cm', ),
              SizedBox(
                height: 20.0,
              ),
              Text('Hauteur', style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 10.0,),
              Container(
                width: width - (CustomTextStyle().fixPadding * 4.0),
                height: 50.0,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border:
                  Border.all(width: 0.8, color: Colors.grey.withOpacity(0.6)),
                ),
                child: TextField(
//                  style: inputTextStyle,
                  keyboardType: TextInputType.number,
                  controller: depthController,
                  decoration: InputDecoration(
                    hintText: 'Veuillez entrer la Hauteur en cm',
//                    hintStyle: inputTextStyle,
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (v) {
                    if (depthController.text != '') {
                      setState(() {
                        depth = true;
                      });
                    } else {
                      setState(() {
                        depth = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 10.0,),
              Text('Hauteur en cm', ),
              SizedBox(height: 20.0,),
              // Weight Start
              Text('Poids', style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 10.0,),
              Container(
                width: width - (CustomTextStyle().fixPadding * 4.0),
                height: 50.0,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border:
                  Border.all(width: 0.8, color: Colors.grey.withOpacity(0.6)),
                ),
                child: TextField(
//                  style: inputTextStyle,
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  decoration: InputDecoration(
                    hintText: 'Veuillez entrer le poids en kg',
//                    hintStyle: inputTextStyle,
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (v) {
                    if (weightController.text != '') {
                      setState(() {
                        weight = true;
                      });
                    } else {
                      setState(() {
                        weight = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Poids en  kg', ),
              // Weight End
            ],
          ),
        ),
      ],
    );
  }

  /// Pickup Address Screen Start
  selectPickupAddressScreenCode() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Container(
          width: width,
          height: height - 85.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Ouvrir Google Map"),
                  color: Theme.of(context).primaryColor,
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PlacePicker(
                            apiKey: ZewaKeys.GOOGLE_MAP_API_KEY,
                            initialPosition: DeliveryInfo.kInitialPosition,
                            useCurrentLocation: true,
                            selectInitialPosition: true,

                            //usePlaceDetailSearch: true,
                            onPlacePicked: (result) {
                              selectedPickupPlace = result;
                              Navigator.of(context).pop();
                              setState(() {});
                            },
                            selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
                              return isSearchBarFocused
                                  ? Container()
                                  : FloatingCard(
                                bottomPosition: 0.0,
                                leftPosition: 0.0,
                                rightPosition: 0.0,
                                width: 500,
                                borderRadius: BorderRadius.circular(12.0),
                                child: state == SearchingState.Searching
                                    ? Center(
                                    child: CircularProgressIndicator())
                                    : RaisedButton(
                                  child: Text("Pick This Place"),
                                  onPressed: () {
                                    print(selectedPlace.geometry.location);
                                    Navigator.pop(context, selectedPlace);
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );

                    setState(() {
                      selectedPickupPlace = result;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Place le marqueur de la carte aux environs de l\'addresse de retrait du paquet ', ),
                      SizedBox(height: 10.0,),
                      (selectedPickupPlace == null)
                          ? Container()
                          : Text(
                        selectedPickupPlace.formattedAddress ?? "",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      (selectedPickupPlace == null) ? Container() : SizedBox(height: 10.0,),
                      Text('Addresse de retrait', style: Theme.of(context).textTheme.headline5),
                      SizedBox(height: 10.0,),
                      Container(
                        width: width - (CustomTextStyle().fixPadding * 4.0),
                        height: 120.0,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              width: 0.8, color: Theme.of(context).primaryColor.withOpacity(0.6)),
                        ),
                        child: TextField(
//                          style: inputTextStyle,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          controller: pickupAddressController,
                          decoration: InputDecoration(
                            hintText: 'Décrivez au livreur l\'addresse de retait',
                            hintStyle: Theme.of(context).textTheme.bodyText1,
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                          ),
                          onChanged: (v) {
                            if (pickupAddressController.text != '') {
                              setState(() {
                                pickupAddress = true;
                              });
                            } else {
                              setState(() {
                                pickupAddress = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  /// Pickup Address Screen End

  /// Delivery Address Screen Start
  selectDeliveryAddressScreenCode() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Container(
          width: width,
          height: height - 85.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Load Google Map"),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PlacePicker(
                            apiKey: ZewaKeys.GOOGLE_MAP_API_KEY,
                            initialPosition: DeliveryInfo.kInitialPosition,
                            useCurrentLocation: true,
                            selectInitialPosition: true,

                            //usePlaceDetailSearch: true,
                            onPlacePicked: (result) {
                              selectedDeliveryPlace = result;
                              Navigator.of(context).pop();
                              setState(() {});
                            },
                            selectedPlaceWidgetBuilder:
                                (_, selectedPlace, state, isSearchBarFocused) {
                              return isSearchBarFocused
                                  ? Container()
                                  : FloatingCard(
                                bottomPosition: 0.0,
                                leftPosition: 0.0,
                                rightPosition: 0.0,
                                width: 500,
                                borderRadius: BorderRadius.circular(12.0),
                                child: state == SearchingState.Searching
                                    ? Center(
                                    child:
                                    CircularProgressIndicator())
                                    : RaisedButton(
                                  child: Text("Pick This Place"),
                                  onPressed: () {
                                    Navigator.pop(
                                        context, selectedPlace);
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );

                    setState(() {
                      selectedDeliveryPlace = result;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Placez le marqueur sur de ma carte sur aux environs de l\'addresse de livraions', ),
                      SizedBox(height: 20.0,),
                      (selectedDeliveryPlace == null)
                          ? Container()
                          : Text(
                        selectedDeliveryPlace.formattedAddress ?? "",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      (selectedDeliveryPlace == null)
                          ? Container()
                          : SizedBox(height: 10.0,),
                      Text('Addresse de livraison',  style: Theme.of(context).textTheme.headline5),
                      SizedBox(height: 10.0,),
                      Container(
                        width: width - (CustomTextStyle().fixPadding * 4.0),
                        height: 120.0,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              width: 0.8, color: Colors.grey.withOpacity(0.6)),
                        ),
                        child: TextField(
//                          style: inputTextStyle,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          controller: deliveryAddressController,
                          decoration: InputDecoration(
                            hintText: 'Veuillez fournir plus d\'indiquations sur l\'addresse de livraison',
//                            hintStyle: inputTextStyle,
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                          ),
                          onChanged: (v) {
                            if (deliveryAddressController.text != '') {
                              setState(() {
                                deliveryAddress = true;
                              });
                            } else {
                              setState(() {
                                deliveryAddress = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  /// Delivery Address Screen End

  /// Confirm Screen Start
  confirmScreenCode() {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomSheet: Wrap(
        children: [
          Material(
            elevation: 0.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: CustomTextStyle().fixPadding * 2.0,
                      left: CustomTextStyle().fixPadding * 2.0,
                      top: CustomTextStyle().fixPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Pickup Start
                      Container(
                        width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enlèvement',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(height: 10.0,),
                            Text(pickupAddressController.text,),
                          ],
                        ),
                      ),
                      // Pickup End
                      // Delivery Start
                      Container(
                        width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Remise',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(height: 10.0,),
                            Text(deliveryAddressController.text,),
                          ],
                        ),
                      ),
                      // Delivery End
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(
                      right: CustomTextStyle().fixPadding * 2.0,
                      left: CustomTextStyle().fixPadding * 2.0, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Size Start
                      Container(
                        width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Taille',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(height: 10.0,),
                            Text('${heightController.text} x ${widthController.text} x ${depthController.text} cm', ),
                          ],
                        ),
                      ),
                      // Size End
                      // Weight Start
                      Container(
                        width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Poids',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(height: 10.0,),
                            Text('${weightController.text} kg', ),
                          ],
                        ),
                      ),
                      // Weight End
                    ],
                  ),
                ),
                Divider(),
                Container(
                  color: Theme.of(context).accentColor,
                  padding: EdgeInsets.all(CustomTextStyle().fixPadding),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
///                      Text('Distance: ${(calculateDistance(selectedPickupPlace.geometry.location.lat, selectedPickupPlace.geometry.location.lng, selectedDeliveryPlace.geometry.location.lat, selectedDeliveryPlace.geometry.location.lng)).toStringAsFixed(2)} km', style: Theme.of(context).textTheme.headline5),
                      Text('Distance: 12 km', style: Theme.of(context).textTheme.headline5),
                      SizedBox(height: 5.0),
                      Text('Estimation: \$15', style: Theme.of(context).textTheme.headline5),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        child: Text(
          "Ici sera affiché la carte où on voit la route pour aller du pickup au delivery"
        ),
      )
          /*
      RouteMap(
          sourceLat: selectedPickupPlace.geometry.location.lat,
          sourceLang: selectedPickupPlace.geometry.location.lng,
          destinationLat: selectedDeliveryPlace.geometry.location.lat,
          destinationLang: selectedDeliveryPlace.geometry.location.lng),
      */
    );
  }
  /// Confirm Screen End

 /// Back Button Start
  backButton() {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (packageSizeWeightScreen) {
          setState(() {
            packageTypeScreen = true;
            packageSizeWeightScreen = false;
          });
        }
        if (selectPickUpAddressScreen) {
          setState(() {
            selectPickUpAddressScreen = false;
            packageSizeWeightScreen = true;
          });
        }

        if (selectDeliveryAddressScreen) {
          setState(() {
            selectDeliveryAddressScreen = false;
            selectPickUpAddressScreen = true;
          });
        }

        if (confirmScreen) {
          setState(() {
            confirmScreen = false;
            selectDeliveryAddressScreen = true;
          });
        }
      },
      child: Container(
        width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
        padding: EdgeInsets.all(CustomTextStyle().fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
        ),
        child: Text('Précédent', style: Theme.of(context).textTheme.headline5),
      ),
    );
  }
  /// Back Button End

  /// Continue Button Start
  continueButton() {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (packageTypeScreen) {
          if (documents || parcel) {
            setState(() {
              packageTypeScreen = false;
              packageSizeWeightScreen = true;
            });
          }
        } else if (packageSizeWeightScreen) {
          if (height && widthInput && depth && weight) {
            setState(() {
              packageSizeWeightScreen = false;
              selectPickUpAddressScreen = true;
            });
          }
        } else if (selectPickUpAddressScreen) {
///          if (pickupAddress && selectedPickupPlace != null) {
            if (pickupAddress ) {
            setState(() {
              selectPickUpAddressScreen = false;
              selectDeliveryAddressScreen = true;
            });
          }
        } else if (selectDeliveryAddressScreen) {
///          if (deliveryAddress && selectedDeliveryPlace != null) {
            if (deliveryAddress ) {
            setState(() {
              selectDeliveryAddressScreen = false;
              confirmScreen = true;
            });
          }
        } else if (confirmScreen) {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: PaymentScreen()));
        }
      },
      child: Container(
        width: (width - (CustomTextStyle().fixPadding * 6.0)) / 2.0,
        padding: EdgeInsets.all(CustomTextStyle().fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            width: 1.0,
            color: (packageTypeScreen)
                ? (documents || parcel) ? Theme.of(context).primaryColor : Colors.grey
                : (packageSizeWeightScreen)
                ? (height && widthInput && depth && weight)
                ?Theme.of(context).primaryColor : Colors.grey
                : (selectPickUpAddressScreen)
///                ? (pickupAddress && selectedPickupPlace != null)
                ? (pickupAddress)
                ? Theme.of(context).primaryColor : Colors.grey
                : (selectDeliveryAddressScreen)
                ///? (deliveryAddress && selectedDeliveryPlace != null)
                ? (deliveryAddress )
                ?Theme.of(context).primaryColor : Colors.grey
                : (confirmScreen) ? Theme.of(context).primaryColor : Colors.grey,
          ),
          color: (packageTypeScreen)
              ? (documents || parcel) ? Theme.of(context).primaryColor : Colors.grey
              : (packageSizeWeightScreen)
              ? (height && widthInput && depth && weight)
              ? Theme.of(context).primaryColor : Colors.grey
              : (selectPickUpAddressScreen)
///              ? (pickupAddress && selectedPickupPlace != null)
              ? (pickupAddress)
              ? Theme.of(context).primaryColor : Colors.grey
              : (selectDeliveryAddressScreen)
             /// ? (deliveryAddress && selectedDeliveryPlace != null)
              ? (deliveryAddress)
              ? Theme.of(context).primaryColor : Colors.grey
              : (confirmScreen) ? Theme.of(context).primaryColor : Colors.grey,
        ),
        child: Text((confirmScreen) ? 'Payer' : 'Continuer',
            style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
