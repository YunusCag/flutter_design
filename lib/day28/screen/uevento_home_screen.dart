import 'package:flutter/material.dart';
import 'package:flutter_login_design/day28/data/data.dart';
import 'package:flutter_login_design/day28/models/date_model.dart';
import 'package:flutter_login_design/day28/models/event_type_model.dart';
import 'package:flutter_login_design/day28/models/events_model.dart';
class UEventToHomeScreen extends StatefulWidget {
  @override
  _UEventToHomeScreenState createState() => _UEventToHomeScreenState();
}

class _UEventToHomeScreenState extends State<UEventToHomeScreen> {
  List<DateModel> dates = new List<DateModel>();
  List<EventTypeModel> eventsType = new List();
  List<EventsModel> events = new List<EventsModel>();
  String todayDateIs = "12";

  int selectedIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dates = getDates();
    eventsType = getEventTypes();
    events = getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff102733)
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 40,horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/event/logo.png",height: 28,),
                        SizedBox(width: 8,),
                        Row(
                          children: <Widget>[
                            Text("UVE", style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w800
                            ),),
                            Text("NTO", style: TextStyle(
                                color: Color(0xffFCCD00),
                                fontSize: 22,
                                fontWeight: FontWeight.w800
                            ),)
                          ],
                        ),
                        Spacer(),
                        Image.asset("assets/event/notify.png", height: 22,),
                        SizedBox(width: 16,),
                        Image.asset("assets/event/menu.png", height: 22,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Hello, David!", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 21
                            ),),
                            SizedBox(height: 6,),
                            Text("Let's explore what’s happening nearby",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),)
                          ],
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 3,
                                color: Color(0xffFAE072)
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset("assets/images/user.jpg", height: 40,)),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),

                    /// Dates
                    Container(
                      height: 60,
                      child: ListView.builder(
                          itemCount: dates.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  selectedIndex=index;
                                });
                              },
                              child: DateTile(
                                weekDay: dates[index].weekDay,
                                date: dates[index].date,
                                isSelected: selectedIndex==index,
                              ),
                            );
                          }),
                    ),

                    /// Events
                    SizedBox(height: 16,),
                    Text("All Events", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                    SizedBox(height: 16,),
                    Container(
                      height: 100,
                      child: ListView.builder(
                          itemCount: eventsType.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return EventTile(
                              imgAssetPath: eventsType[index].imgAssetPath,
                              eventType: eventsType[index].eventType,
                            );
                          }),
                    ),

                    /// Popular Events
                    SizedBox(height: 16,),
                    Text("Popular Events", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                    Container(
                      padding: EdgeInsets.only(bottom: 50),
                      child: ListView.builder(
                          itemCount: events.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            return PopularEventTile(
                              desc: events[index].desc,
                              imgeAssetPath: events[index].imgeAssetPath,
                              date: events[index].date,
                              address: events[index].address,
                            );
                          }),
                    )
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
class DateTile extends StatelessWidget {

  String weekDay;
  String date;
  bool isSelected;
  DateTile({this.weekDay, this.date, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected ? Color(0xffFCCD00) : Colors.transparent,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(date, style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 10,),
          Text(weekDay, style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600
          ),)
        ],
      ),
    );
  }
}

class EventTile extends StatelessWidget {

  String imgAssetPath;
  String eventType;
  EventTile({this.imgAssetPath, this.eventType});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: Color(0xff29404E),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imgAssetPath, height: 27,),
          SizedBox(height: 12,),
          Text(eventType, style: TextStyle(
              color: Colors.white
          ),)
        ],
      ),
    );
  }
}

class PopularEventTile extends StatelessWidget {

  String desc;
  String date;
  String address;
  String imgeAssetPath;/// later can be changed with imgUrl
  PopularEventTile({this.address,this.date,this.imgeAssetPath,this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Color(0xff29404E),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(desc, style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ),),
                  SizedBox(height: 8,),
                  Row(
                    children: <Widget>[
                      Image.asset("assets/event/calender.png", height: 12,),
                      SizedBox(width: 8,),
                      Text(date, style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),)
                    ],
                  ),
                  SizedBox(height: 4,),
                  Row(
                    children: <Widget>[
                      Image.asset("assets/event/location.png", height: 12,),
                      SizedBox(width: 8,),
                      Text(
                        address,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
              child: Image.asset(imgeAssetPath, height: 100,width: 118, fit: BoxFit.cover,)),
        ],
      ),
    );
  }
}