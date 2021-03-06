import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/CustomShapeClipper.dart';
import '../components/custom_text.dart';
import '../helpers/style.dart';
import 'home.dart';

class IconColors {
  static const Color send = Color(0xffecfaf8);
  static const Color transfer = Color(0xfffdeef5);
  static const Color passbook = Color(0xfffff4eb);
  static const Color more = Color(0xffeff1fe);
}

class IconImgs {
  static const String send = "images/assets/imgs/send.png";
  static const String transfer = "images/assets/imgs/transfer.png";
  static const String passbook = "images/assets/imgs/passbook.png";
  static const String more = "images/assets/imgs/more.png";
  static const String freeze = "images/assets/imgs/freeze.png";
  static const String unlock = "images/assets/imgs/unlock.png";
  static const String secret = "images/assets/imgs/secret.png";
}




class PaymentButtonScreen extends StatelessWidget {
  Color firstColor = Color(0xFFF47D15);
  Color secondColor = Color(0xFFEF772C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFEF772C),
        elevation: 0.0,
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [firstColor, secondColor],
                    ),
                  ),
                ),
              ),
            ]),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MomoScreen()));
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(20)),
              child:Padding(
                padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 35,
                      height: 25,
                      child: Image.asset(
                        'images/icon/momo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20,),
                    CustomText(
                      text: "Thanh toán qua momo",
                      color: white,
                      size: 18,
                      weight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyCards()));
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(20)),
              child:Padding(
                padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 35,
                      height: 25,
                        child: Image.asset(
                          'images/icon/mastercard.png',
                          fit: BoxFit.cover,
                        ),
                    ),
                    SizedBox(width: 20,),
                    CustomText(
                      text: "Thanh toán bằng card",
                      color: white,
                      size: 18,
                      weight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class MomoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color firstColor = Colors.orange.shade200;
    Color secondColor = Colors.orange.shade400;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        title: Text(
          'My MoMo',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0.5,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 350,
                    height: 350,
                    child: Image.asset('images/payment/momovector.png', fit: BoxFit.fill),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                         "Thank you for purchasing our product ^^",
                      textAlign: TextAlign.center,
                      style : TextStyle( color: Colors.teal,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,)
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}


class MyCards extends StatefulWidget {
  MyCards({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyCardsPageState createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        title: Text(
          'My Card',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0.5,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.grey[300],
                      spreadRadius: 5.0),
                ],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(51),
                  bottomLeft: Radius.circular(51),
                ),
                color: Colors.white,
              ),
              child: Hero(
                tag: "card",
                child: InkWell(
                  child: CreditCardContainer(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            CustomContainer(
              child: FittedBox(
                child: Row(
                  children: <Widget>[
                    CustomIconButton(
                      buttonImg: IconImgs.unlock,
                      buttonTitle: "UNLOCK PIN/CVV",
                      circleColor: IconColors.send,
                      onTap: () {},
                    ),
                    CustomIconButton(
                      buttonImg: IconImgs.freeze,
                      buttonTitle: "FREEZE CARD",
                      circleColor: Colors.lime[100],
                      onTap: () {},
                    ),
                    CustomIconButton(
                      buttonImg: IconImgs.secret,
                      buttonTitle: "SHOW SECRET CODE",
                      circleColor: Colors.pink[100],
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: CustomContainer(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.atm),
                          radius: 20,
                        ),
                        title: Text(
                          "ATM CARDLESS",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        enabled: true,
                        onTap: () {},
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.location_on),
                          radius: 20,
                        ),
                        title: Text(
                          "ATM LOCATOR",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        enabled: true,
                        onTap: () {},
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.security),
                          radius: 20,
                        ),
                        title: Text(
                          "SECURITY CARD",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        enabled: true,
                        onTap: () {},
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.assessment),
                          radius: 20,
                        ),
                        title: Text(
                          "LIMITS",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        enabled: true,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Wallet extends StatefulWidget {
  Wallet({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdee4eb),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black54,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Container(
              height: 21,
              width: 21,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.grey[300],
                      spreadRadius: 5.0),
                ],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(51),
                  bottomLeft: Radius.circular(51),
                ),
                color: Colors.white,
              ),
              child: Hero(
                tag: "card",
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: CreditCardContainer(),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return MyCards(title: "My Cards");
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            CustomContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomIconButton(
                    circleColor: IconColors.send,
                    buttonImg: "images/assets/imgs/send.png",
                    buttonTitle: "SEND",
                    onTap: () {},
                  ),
                  CustomIconButton(
                    circleColor: IconColors.transfer,
                    buttonImg: "images/assets/imgs/transfer.png",
                    buttonTitle: "TRANSFER",
                    onTap: () {},
                  ),
                  CustomIconButton(
                    circleColor: IconColors.passbook,
                    buttonImg: "images/assets/imgs/passbook.png",
                    buttonTitle: "PASSBOOK",
                    onTap: () {},
                  ),
                  CustomIconButton(
                    circleColor: IconColors.more,
                    buttonImg: "images/assets/imgs/more.png",
                    buttonTitle: "MORE",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            CustomContainer(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Transactions",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      CustomRoundedButton(
                        buttonText: "More",
                        color: Colors.blue,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      HistoryListTile(
                        iconColor: IconColors.transfer,
                        onTap: () {},
                        transactionAmount: "+\$210.00",
                        transactionIcon: IconImgs.transfer,
                        transactionName: "Amazigh Halzoun",
                        transactionType: "TRANSFER",
                      ),
                      HistoryListTile(
                        iconColor: IconColors.transfer,
                        onTap: () {},
                        transactionAmount: "-\$310.00",
                        transactionIcon: IconImgs.transfer,
                        transactionName: "Cybdom Tech",
                        transactionType: "TRANSFER",
                      ),
                      HistoryListTile(
                        iconColor: IconColors.send,
                        onTap: () {},
                        transactionAmount: "-\$210.00",
                        transactionIcon: IconImgs.send,
                        transactionName: "Wife",
                        transactionType: "SEND",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryListTile extends StatelessWidget {
  final Color iconColor;
  final String transactionName,
      transactionType,
      transactionAmount,
      transactionIcon;
  final GestureTapCallback onTap;

  const HistoryListTile({
    Key key,
    this.iconColor,
    this.transactionName,
    this.transactionType,
    this.transactionAmount,
    this.transactionIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(transactionName),
        subtitle: Text(transactionType),
        trailing: Text(transactionAmount),
        leading: CircleAvatar(
          radius: 25,
          child: Image.asset(
            transactionIcon,
            height: 25,
            width: 25,
          ),
          backgroundColor: iconColor,
        ),
        enabled: true,
        onTap: onTap,
      ),
    );
  }
}

class CustomRoundedButton extends StatelessWidget {
  final Color color;
  final String buttonText;
  final GestureTapCallback onTap;

  CustomRoundedButton({
    @required this.color,
    @required this.buttonText,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 7.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            "More",
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String buttonTitle, buttonImg;
  final GestureTapCallback onTap;
  final Color circleColor;

  const CustomIconButton({
    @required this.circleColor,
    @required this.buttonTitle,
    @required this.buttonImg,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: circleColor,
                child: Image.asset(
                  buttonImg,
                  height: 19,
                  width: 19,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                buttonTitle,
                overflow: TextOverflow.clip,
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreditCardContainer extends StatelessWidget {
  const CreditCardContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 31, vertical: 21),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0, color: Colors.red[200], offset: Offset(0, 5)),
        ],
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [
            Color(0xffff8964),
            Color(0xffff5d6e),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(
                "images/assets/imgs/chip.png",
                width: 51,
                height: 51,
              ),
            ),
            Text(
              "4000 1234 5678 9010",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "VALID FROM: ",
                      style: TextStyle(color: Colors.white, fontSize: 11.0),
                    ),
                    Text(
                      "09/21",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  width: 21,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "VALID THRU: ",
                      style: TextStyle(color: Colors.white, fontSize: 11.0),
                    ),
                    Text(
                      "09/23",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              "KHUE TO MINH",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget child;

  CustomContainer({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 21),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey[300],
            spreadRadius: 5.0,
          ),
        ],
        borderRadius: BorderRadius.circular(41),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
