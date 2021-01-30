import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const PREFERENCE_SHOW_WELLCOME_SHOWCASE = "pref_show_wellcome_showcase";
const PREFERENCE_SHOW_LIFT_SHOWCASE = "pref_show_lift_showcase";
const PREFERENCE_SHOW_ONBOARD = "pref_show_onboard";
const PREFERENCE_DARK_THEME = "pref_dark_theme";
const PREFERENCE_PUSH_NOTIFICATIONS = "pref_push_notifications";
const PREFERENCE_LANGUAGE_INDEX = "pref_language_index";

const HISTORY_SCREEN_NUMPAGE = 6;
const CAMPAIGN_TYPE_KONE = 4;
const CAMPAIGN_TYPE_OTIS = 5;
const CAMPAIGN_TYPE_OTIS2 = 6;

const SHIFT4_INTERFACE_VERSION = "1.0";
const SHIFT4_INTERFACE_NAME = "Minfo Global App";
const SHIFT4_AGENT_COMPANY_NAME = "Minfo inc";
const SHIFT4_ACCESS_TOKEN = "6B05C955-4351-47C5-84ED-EDC4A6CB4F00";


const MINFO_HELP_PAGE_URL = "https://www.minfo.com/FAQ.aspx";

const SHIFT4_PREAUTHORIZE_URL = "http://testz.minfo.com/desktopmodules/cs.campaign/services/minfoservices.asmx/AuthorizedShift4Payment";

/*
camapign
 */
const  LEFT_ARROW = 1;
const  RIGHT_ARROW = 2;
const  ALIGN_LEFT = "LEFT";

const KONE_CLIENT_ID = "0be065c8-2240-4a67-8e99-a54cdebae710";
const KONE_CLIENT_SECRET = "sX4tV7bY8mE3oU8tO7wY3nC1yB5aS6xT3lG4xK5rH0hB0eJ0aU";

const KONE_CALL_STATE_CREATED = "created";
const KONE_CALL_STATE_APPROVED = "approved";
const KONE_CALL_STATE_SERVED = "served";
const KONE_CALL_STATE_CANCELLED = "cancelled";

const KONE_PASSENGER_GUIDANCE_WAIT_FOR_CAR = "wait_for_car";
const KONE_PASSENGER_GUIDANCE_ENTER_CAR = "enter_car";
const KONE_PASSENGER_GUIDANCE_STAY_IN_CAR = "stay_in_car";
const KONE_PASSENGER_GUIDANCE_EXIT_CAR = "exit_car";
const KONE_PASSENGER_GUIDANCE_CALL_CANCELLED = "call_cancelled";


const LIFT_BUTTON_STYLE_ROUND = "ROUND";

const SHOW_HISTORY = "minfo_history";
const SHOW_QR_SCAN = "qr_scan";
const SHOW_MULTI_CONNECT = "multi_connect";
const SHOW_SINGLE_CONNECT = "single_connect";
const SHOW_MINFO_ZONE = "show_minfo_zone";
const SHOW_PROFESSIONNAL_AUDIO = "show_professionnal_audio";
const SHOW_PERSONNAL_AUDIO = "show_personnal_audio";

class RemoteConfigConst {
  static const String SHOW_CHAT_ROOM = "show_chat_room";
}
const SHOW_WELLCOME_TOAST_MSG = "show_wellcome_toast";
const SHOW_WELLCOME_CAMPAIGN_SEARCH = "campaign_search";
const SHOW_CAMPAIGN_SEARCH = "show_minfo_search_screen";
const SHOW_CAMPAIGN_SEARCH_2 = "show_minfo_search_screen_2";
//const MINFO_URL = "https://www.minfo.com";
const LINKED_IN_REDIRECT_URL = "https://www.minfo.com";
const LINKED_IN_CLIENT_ID = "77oreez1vtces9";
const LINKED_IN_CLIENT_SECRET = "hFmJMHzI29bryR3k";
/*
const LINKED_IN_CLIENT_ID = "86glo9uf4it5xq";
const LINKED_IN_CLIENT_SECRET = "7DcrXsa0d92BYlM0";

 */

const CAMPAIGN_PROFESSIONNAL = "Professional";
const CAMPAIGN_PERSONNAL = "Personal";




// Elevator buttons font size
const double sizeHeadline1 = 76.29;
const double sizeHeadline2 = 61.04;
const double sizeHeadline3 = 48.83;
const double sizeHeadline4 = 39.06;
const double sizeHeadline5 = 31.25;
const double sizeHeadline6 = 25.0;
const double sizeSubtitle1 = 20.0;
const double sizeSubtitle2 = 16.0;
const double sizeBody1 = 16.0;
const double sizeBody2 = 14.0;
const double sizeCaption = 12.80;

//Elevator padding
const double appPadding = 16.00;



class ProfilePropertyIds {
  static const int COUNTRY = 31;
  static const int ZIPCODE = 32;
  static const int PHONE = 33;
  static const int PHOTO = 38;
  static const int GENDER = 87;
  static const int LINKEDIN = 159;
  static const int LINKEDINPERSONAL = 160;
  static const int YOUTUBE = 162;
  static const int TWITTER = 163;
  static const int INSTAGRAM = 164;
  static const int PINTEREST = 165;
  static const int FACEBOOK = 166;
  static const int PHOTOPERSONAL = 167;
  static const int YOUTUBEPERSONAL = 168;
  static const int TWITTERPERSONAL = 169;
  static const int INSTAGRAMPERSONAL = 170;
  static const int PINTERESTPERSONAL = 171;
  static const int FACEBOOKPERSONAL = 172;
  static const double BUTTON_FONT_SIZE = 14.0;
}

// the original name refers to professional profile (the same goes for Photo and PhotoPersonal)
const String FACEBOOK = "Facebook";
const String LINKEDIN = "LinkedIn";
const String YOUTUBE = "Youtube";
const String TWITTER = "Twitter";
const String INSTAGRAM = "Instagram";
const String PINTEREST = "Pinterest";
// [Personal] appended to the social media referes to personal profile (i.e. FacebookPersonal)
const String PERSONAL = "Personal";

final socialMediaList = [
  SocialMedia(
      icon: Icon(
        MdiIcons.facebookBox,
        color: Colors.blue[600].withOpacity(0.9),
      ),
      title: FACEBOOK,
      httpLink: "http://www.facebook.com/"),
  SocialMedia(
      icon: Icon(
        MdiIcons.linkedinBox,
        color: Colors.blue[600].withOpacity(0.9),
      ),
      title: LINKEDIN,
      httpLink: "https://www.linkedin.com/in/"),
  SocialMedia(
      icon: Icon(
        MdiIcons.youtube,
        color: Colors.red[600].withOpacity(0.9),
      ),
      title: YOUTUBE,
      httpLink: "https://www.youtube.com/user/"),
  SocialMedia(
      icon: Icon(
        MdiIcons.twitterBox,
        color: Colors.blue[300].withOpacity(0.9),
      ),
      title: TWITTER,
      httpLink: "https://www.twitter.com/"),
  SocialMedia(
      // Container(
      //   child: Icon(
      //     MdiIcons.instagram,
      //     size: 20.0,
      //     color: Colors.white,
      //   ),
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topRight,
      //       end: Alignment.bottomLeft,
      //       stops: [0.4, 0.6, 0.9],
      //       colors: [
      //         Colors.purple,
      //         Colors.red,
      //         Colors.yellow[800],
      //       ],
      //     ),
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(5.0),
      //     ),
      //   ),
      icon: Icon(
        MdiIcons.instagram,
        color: Colors.pink[500].withOpacity(0.9),
      ),
      title: INSTAGRAM,
      httpLink: "https://www.instagram.com/"),
  SocialMedia(
      icon: Icon(
        MdiIcons.pinterestBox,
        color: Colors.red[600],
      ),
      title: PINTEREST,
      httpLink: "https://www.pinterest.com/"),
];

class SocialMedia {
  final Widget icon;
  final String title;
  final String httpLink;

  const SocialMedia({
    this.icon,
    this.title,
    this.httpLink,
  });
}

class ButtonType {
  static const int PAYMENT_GATEWAY = 1;
  static const int URL_LINK = 2;
  static const int ADD_TO_MOBILE_APP = 3;
  static const int CALL_NUMBER = 4;
  static const int SMS = 5;
  static const int EMAIL = 6;
  static const int REMIND_BUY_PRODUCT = 7;
  static const int ORDER_PRODUCT = 8;
  static const int DONATE = 9;
  static const int REMIND_WATCH_PROGRAM = 10;
  static const int VCARD = 11;
  static const int PDF = 12;
  static const int AUDIO = 13;
  static const int PICTURE = 14;
  static const int BID = 21;
  static const int PRIZE_DRAW = 22;
  static const int YOUTUBE = 23;
  static const int REMIND_ME = 24;
  static const int TAB = 27;
  static const int SOUND = 26;
  static const int BTN_VOTE = 28;
  static const int BTN_QUESTION = 29;
  static const int SALESFORCE = 30;
  static const int POWERPOINT = 32;
  static const int KEYNOTE = 33;
  static const int CALL_LIFT_NUMBER = 34;

  static const int FAVOURITE = 98;
  static const int SHARE_WITH = 99;

}

class ButtonPropertyDefinition {
  static const int purchase_Fee_Payment = 1;
  static const int Phone_Number = 2;
  static const int SMS_Number = 3;
  static const int SMS_Description = 4;
  static const int Purchase_Fee_Order_Product = 5;
  static const int Default_Money_Donate = 6;
  static const int Subject_Remind_Buy_Product = 48;
  static const int Date_Remind_Buy_Product = 50;
  static const int Date_Remind_Buy_Product_End_Date = 61;
  static const int Comment_Remind_Buy_Product = 51;
  static const int Subject_Remind_Watch_Program = 11;
  static const int Location_Remind_Watch_Program = 47;
  static const int Date_Remind_Watch_Program = 13;
  static const int Date_Remind_Watch_Program_End = 60;
  static const int Station_Remind_Watch_Program = 14;
  static const int Comment_Remind_Watch_Program = 15;
  static const int Name_VCard = 16;
  static const int Title_VCard = 20;
  static const int Mobile_Phone_VCard = 21;
  static const int Telephone_VCard = 22;
  static const int Email_VCard = 23;
  static const int Quantity_Bid = 31;
  static const int Start_Price_Bid = 33;
  static const int Closes_Time_Bid = 34;
  static const int Item_Value_Bid = 35;
  static const int Price_Increments_Bid = 36;
  static const int Vcard_First_Name = 37;
  static const int Vcard_Last_Name = 38;
  static const int Vcard_Company_Name = 39;
  static const int Vcard_Street = 40;
  static const int PDF_File = 41;
  static const int Email = 42;
  static const int Image_File = 43;
  static const int Vcard_ZipCode = 44;
  static const int Remind_Location = 52;
  static const int Vcard_Town = 53;
  static const int Vcard_State = 54;
  static const int Remind_TimeZone = 57;
  static const int Vcard_Image = 73;
}
