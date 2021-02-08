import 'package:flutter/material.dart';
import 'package:pickit/pages/main_homepage.dart';
import 'package:pickit/utils/constants.dart';
class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool amazon = true,
      card = false,
      paypal = false,
      skrill = false,
      cashOn = false;

  successOrderDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 170.0,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 70.0,
                  width: 70.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    border: Border.all(color: Theme.of(context).primaryColor, width: 1.0),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 40.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Success!",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainHomePage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        titleSpacing: 0.0,
        title: Text('Payment',),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          width: width,
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: width - CustomTextStyle().fixPadding * 4.0,
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    'Payer 1000 FCFA',
                  ),
                  onPressed: () {
                    successOrderDialog();
                  },
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [

          getPaymentTile('Cash', 'assets/payment_icon/cash_on_delivery.png'),
          getPaymentTile('Amazon Pay', 'assets/payment_icon/amazon_pay.png'),
          getPaymentTile('Card', 'assets/payment_icon/card.png'),
          getPaymentTile('PayPal', 'assets/payment_icon/paypal.png'),
          getPaymentTile('Skrill', 'assets/payment_icon/skrill.png'),
          Container(height: CustomTextStyle().fixPadding * 2.0),
        ],
      ),
    );
  }

  getPaymentTile(String title, String imgPath) {
    return InkWell(
      onTap: () {
        if (title == 'Cash') {
          setState(() {
            cashOn = true;
            amazon = false;
            card = false;
            paypal = false;
            skrill = false;
          });
        } else if (title == 'Amazon Pay') {
          setState(() {
            cashOn = false;
            amazon = true;
            card = false;
            paypal = false;
            skrill = false;
          });
        } else if (title == 'Card') {
          setState(() {
            cashOn = false;
            amazon = false;
            card = true;
            paypal = false;
            skrill = false;
          });
        } else if (title == 'PayPal') {
          setState(() {
            cashOn = false;
            amazon = false;
            card = false;
            paypal = true;
            skrill = false;
          });
        } else if (title == 'Skrill') {
          setState(() {
            cashOn = false;
            amazon = false;
            card = false;
            paypal = false;
            skrill = true;
          });
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            right: CustomTextStyle().fixPadding * 2.0,
            left: CustomTextStyle().fixPadding * 2.0,
            top: CustomTextStyle().fixPadding * 2.0),
        padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(
            width: 1.0,
            color: (title == 'Cash')
                ? (cashOn) ? Theme.of(context).primaryColor : Colors.grey[300]
                : (title == 'Amazon Pay')
                ? (amazon) ? Theme.of(context).primaryColor : Colors.grey[300]
                : (title == 'Card')
                ? (card) ? Theme.of(context).primaryColor : Colors.grey[300]
                : (title == 'PayPal')
                ? (paypal) ? Theme.of(context).primaryColor : Colors.grey[300]
                : (skrill) ? Theme.of(context).primaryColor : Colors.grey[300],
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70.0,
                  child:
                  Image.asset(imgPath, height: 80.0, fit: BoxFit.contain),
                ),
                SizedBox(width: 20.0,),
                Text(title, style: Theme.of(context).textTheme.headline4),
              ],
            ),
            Container(
              width: 20.0,
              height: 20.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  width: 1.5,
                  color: (title == 'Cash')
                      ? (cashOn) ? Theme.of(context).primaryColor : Colors.grey[300]
                      : (title == 'Amazon Pay')
                      ? (amazon) ? Theme.of(context).primaryColor : Colors.grey[300]
                      : (title == 'Card')
                      ? (card) ? Theme.of(context).primaryColor : Colors.grey[300]
                      : (title == 'PayPal')
                      ? (paypal) ? Theme.of(context).primaryColor : Colors.grey[300]
                      : (skrill) ? Theme.of(context).primaryColor : Colors.grey[300],
                ),
              ),
              child: Container(
                width: 10.0,
                height: 10.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: (title == 'Cash')
                      ? (cashOn) ? Theme.of(context).primaryColor : Colors.transparent
                      : (title == 'Amazon Pay')
                      ? (amazon) ? Theme.of(context).primaryColor : Colors.transparent
                      : (title == 'Card')
                      ? (card) ? Theme.of(context).primaryColor : Colors.transparent
                      : (title == 'PayPal')
                      ? (paypal) ? Theme.of(context).primaryColor : Colors.transparent
                      : (skrill)
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
