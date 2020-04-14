//import 'dart:html';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sajilohealth/Services/auth.dart';
import 'package:sajilohealth/helper/news.dart';
import 'package:sajilohealth/models/article.dart';
import 'package:sajilohealth/models/article_view.dart';
import 'package:sajilohealth/views/home_screens/ChildCare.dart';
//import 'package:sajilohealth/router.dart';
import 'package:sajilohealth/views/home_screens/EPharmView.dart';
import 'package:sajilohealth/views/home_screens/HealthCareView.dart';
import 'package:sajilohealth/views/home_screens/LabView.dart';
import 'package:sajilohealth/views/home_screens/MensCare.dart';
import 'package:sajilohealth/views/home_screens/WomanCare.dart';

class BasicHomeView extends StatefulWidget{
 

  _BasicHomeView createstate() => _BasicHomeView();
  Widget build(BuildContext context){
  //pages for the tabs 


    return MaterialApp(
      routes: {
        '/':(context)=>BasicHomeView(),
        '/secondRoute':(context)=>EPharmView(),
        '/labRoute':(context)=>LabView(),
        '/childCareRoute':(context)=>ChildCareView(),
        '/womanCareView':(context)=>WomanCareView(),
        '/menCareView':(context)=>MensCareView(),
        '/HealthProductView':(context)=>HealthCareView(),
      },
      color: Colors.lightBlueAccent[100],
      darkTheme: ThemeData.dark(),
      title: 'SajiloHealth',
      
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _BasicHomeView();
  }
} 
// trying to create a stateful widget to access the face icon and change the profile information

class _BasicHomeView extends State<BasicHomeView> {
  final AuthService _auth=AuthService();
  List<Article> articles = new List<Article>();

  getNews() async{
    News news= News();
    await news.getNews();
    articles=news.news;
        
      }
    
      
      
      @override
      Widget build(BuildContext context) {
            final _ktabpages=<Widget>[
          Container(
          child:ListView(
             children: <Widget>[
               Container(
                 width:430,
                 height:175,
                 child: Carousel(
    
                   animationDuration: Duration(milliseconds: 500),//animation duration controlled with this line 
                   boxFit: BoxFit.fitWidth,
                   images: [
                     AssetImage("assets/images/Medicines.jpg"),
                     //AssetImage("assets/images/Doctors1.jpg"),
                   ],
                   autoplay: true,
                   dotSize: 4.0,
                   dotColor: Colors.grey,
                   indicatorBgPadding: 4.0,
                 ),
                ),
               Divider(thickness: 2,),
    
               Container(width: 430,
                height: 175,          
                child: ListView(scrollDirection: Axis.horizontal,
                  children: <Widget>[//inside containers start here
                   Container(color: Colors.cyan[100],width: 205,
                    child: Column(
                      children: <Widget>[
                        //use list view with some text message to be displayed if pixel overflow occurs
                        //add expanded or the widgets don't fill up space during screen rotation
                      Expanded(child: Image.asset('assets/images/Medicines.jpg',)),
                      ListTile(title: Text('E-pharm'),onTap: (){
                        Navigator.pushNamed(context, '/secondRoute');
                      },
                      trailing: IconButton(icon: Icon(Icons.keyboard_arrow_right),onPressed: (){
                        Navigator.pushNamed(context, '/secondRoute');
                      },),)],
                    ),
                   ),VerticalDivider(),
                   Container(color: Colors.cyan[100],width: 205,
                    child: Column(//use list view with some text message to be displayed if pixel overflow occurs
                      children: <Widget>[
                      
                       
                        Expanded(child: Image.asset('assets/images/lab.png')),
                        //try using divider
                        ListTile(title: Text('Lab'),onTap: (){
                          Navigator.pushNamed(context, '/labRoute');
                        },
                        trailing: IconButton(icon: Icon(Icons.keyboard_arrow_right),onPressed: (){
                          Navigator.pushNamed(context, '/labRoute');
                        },),)],
                    ),
                  )
                 ],
                ),
              ),//current working conatiner
               Divider(thickness: 2),
    //conatiner with three iconButtons child care, mens care and womens care
               Container( 
                width: 430,
                height: 100,
                child: ListView(
                  scrollDirection:Axis.horizontal,
                  
                  children:
                     <Widget>[
                        Container(color: Colors.cyan[100],
                       width: 146,
                       child: Center(
                         child: IconButton(iconSize: 100,icon: Image.asset('assets/images/BabyCare.jpg'),onPressed: (){
                           Navigator.pushNamed(context, '/childCareRoute');
                         },)),
                        ),
                        VerticalDivider(),
                        Container(
                         color: Colors.cyan[100],
                          width: 146,
                          // the following code distinguishes in the fact that image is used in the icon widget instead of the actual icon
                          child: Center(child:IconButton(icon: Image.asset('assets/images/WomanCare.jpg'),onPressed: (){
                            Navigator.pushNamed(context, '/womanCareView');
                          },iconSize: 300,)
                                   )           ),
                        VerticalDivider(),                     
                        Container(
                         color: Colors.cyan[100],
                          width: 146,
                          // the following code distinguishes in the fact that image is used in the icon widget instead of the actual icon
                          child: Center(child:IconButton(icon: Image.asset('assets/images/MenCare.jpg'),onPressed: (){
                            Navigator.pushNamed(context, '/menCareView');
                          },iconSize: 100,)
                                   )           )          
    
                  ],
                )
              ),
               Divider(thickness: 2),
                Container(
                 width: 430,
               height: 175,
               color: Colors.cyan[100],
               child: Column(
                      children: <Widget>[
                        //use list view with some text message to be displayed if pixel overflow occurs
                        //add expanded or the widgets don't fill up space during screen rotation
    
                        Expanded(child: Image.asset('assets/images/HealthCare.png',fit: BoxFit.cover,colorBlendMode: BlendMode.clear,),flex: 4,),
                        ListTile(title: Text('Health Products'),onTap: (){
                          Navigator.pushNamed(context, '/HealthProductView');
                        },trailing: IconButton(icon: Icon(Icons.keyboard_arrow_right),onPressed: (){
                          Navigator.pushNamed(context, '/HealthProductView');
                        },),)],
                    ),          
               ),
    
    
             ],
           )),
    
    //second tab containing the SajiloHealth blog section
           //for blogsB
          //  Center(child: FloatingActionButton(onPressed:(){}),),
    
          Container(child:
            ListView(
             //outer container
                children:<Widget>[
                  
                    Container(height: 135,
                      width: 1000,// can be adjusted t
                      
                      child: Container(child:Wrap(
                        direction: Axis.horizontal,
                        spacing: 8.0,
                        runSpacing: 4.0,
                        //add more number of items
                        children: ['Diabaties','Blood Pressure','Sugar','test','test2'].map((String name)=>Chip(deleteIcon: IconButton(icon: Icon(Icons.cancel), onPressed: null),shadowColor:Colors.lightGreenAccent,
                          avatar:CircleAvatar(child:Text(name.substring(0,1))),label:Text(name),)).toList(),                  
                        )
                      )
                    ),
                    //wrap to be placed here
                    // Container(child:ListView(
                      //  scrollDirection: Axis.vertical,
                      //  children: <Widget>[Container(height: 150,color: Colors.black,),Divider(),Container(height: 150,color: Colors.deepOrangeAccent,) ]
                    // ),
                    Divider(thickness: 6,),
                    Container(color: Colors.cyan[100],child:Column(
                      children: <Widget>[
                        //use list view with some text message to be displayed if pixel overflow occurs
                        //add expanded or the widgets don't fill up space during screen rotation
    
                        Image.asset('assets/images/Co.png'),
                        Divider(thickness: 6  ,),
                        ListTile(title: Text('symptoms of corona virus'),onTap: (){},trailing: IconButton(icon: Icon(Icons.keyboard_arrow_right),onPressed: (){},),)],
                    )),
                ]),),
     
        Container(
          child: ListView.builder(
            itemCount: articles.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context,index){
              return NewsTile(
                                        imageUrl: articles[index].urlToImage,
                                        title: articles[index].title,
                                        desc: articles[index].description,
                                        url: articles[index].url,
                            
                                      );
                                    }),
                                  
                              ),
                                   ];
                              
                                final ktabs=<Tab>[
                                  Tab(text:'Services'),
                                  Tab(text: 'Blogs'),
                                  Tab(text: 'News',),
                            
                            
                                ];
                                final drawerHeader=UserAccountsDrawerHeader(//This is the widget used in the leftside
                                  decoration: BoxDecoration(color: Colors.cyan),//color of the drawer is manipulated using this line of code
                            
                                  accountName: Text("UserName"),//must be handled according to the user entries
                                  accountEmail: Text('User.email@gmail.com'),//must be handled according to the user entries
                                  currentAccountPicture: 
                                    CircleAvatar(
                                      child: Icon(Icons.face ),
                                      backgroundColor: Colors.white,
                                      
                            
                                    ),
                                  );
                                  final drawerItems= ListView(//contents in the menu item later shall be changed as per the document
                                    children:<Widget>[
                                      drawerHeader,
                                    ListTile(//more arguments in this tile are used than rest of the tiles
                                    // consider looking back at other arguments as well
                                        leading: Icon(
                                          Icons.access_alarms,
                                          color: Colors.teal[300],
                                          semanticLabel: 'reminds you to take your medicine on time',
                                      ),
                                      selected: false,//IF this tile is also enabled then the icons and the text are rendered with same color
                                      title: Text("Medicine reminder"),
                                      onTap: (){},//action to be added
                                    ),
                                    Divider(),
                                    ListTile(
                                      leading: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.teal[300],
                                        ),
                                      title: Text("My cart"),
                                      onTap: (){},//action to be added
                                    ),
                                    Divider(),
                                    ListTile(
                                      leading: Icon(
                                        Icons.history,
                                        color: Colors.teal[300],
                                        ),
                                      title: Text('My History'),
                                      onTap: (){},//Action to be added
                                    ),
                                    Divider(),        
                                    ListTile(
                                    leading: Icon(
                                      Icons.timelapse,
                                      color: Colors.teal[300],
                                      ),
                                    title: Text("Track my Request"),
                                    onTap: (){},//action to be added
                                    ),
                                    Divider(),
                                    ListTile(
                                      leading: Icon(
                                          Icons.shop,
                                          color: Colors.teal[300],
                                          ),
                                      title: Text("Sell on Epharm"),//Name of epharm should be changed
                                      //alert or some informative message should be displayed
                                      onTap: (){},//action to be added\
                            
                                    ),
                                    Divider(),
                                    ListTile(
                                      leading: Icon(
                                          Icons.remove_circle,
                                          color: Colors.redAccent[200],
                                      ) ,
                                      title: Text("Cancel order"),
                                      onTap: (){},//action to be added
                                      //action should be to alert about the time frame to cancel
                                      //time calculation and limit to be set
                                      //(alert message to be displayed if the time limit has exceeded)
                                      //and the further processing of the program
                                    ),
                                    Divider(),
                                    ListTile(
                                      leading: Icon(Icons.help_outline,
                                        color: Colors.teal[300],
                                        ),
                                        title: Text("Help Center"),
                                        onTap: (){},//action to be added
                                    ),
                                    Divider(),
                                    ListTile(
                                      leading: Icon(Icons.account_box,
                                        color: Colors.teal[300],
                                      ),
                                        title: Text("Log out"),// add legal here
                                        onTap: ()async{
                                          await _auth.signOut();
                                        },
                                    ),
                                    Divider(),
                                    ],
                                    );
                                return MaterialApp(
                                      home: DefaultTabController(
                                      length: ktabs.length,
                                      child: Scaffold(
                                        backgroundColor: Colors.white,//try deleting the background color
                                        drawerDragStartBehavior: DragStartBehavior.down,//function not known
                                        extendBodyBehindAppBar: false,
                                        appBar: AppBar(      
                                          title: Text('SajiloHealth'),
                                          backgroundColor: Colors.cyan,
                                          bottom: TabBar(tabs:ktabs),
                                          //add actions when the items are clicked
                                          actions: <Widget>[
                                           IconButton(
                                              icon: Icon(Icons.search),
                                              onPressed: (){},
                                              ),
                                            IconButton(
                                              icon: Icon(Icons.mic),
                                              onPressed:(){},//Action to be added
                                            ),  
                                          ],
                                        ),
                                          drawer: Drawer(       
                                            elevation: 16,
                                            child: drawerItems,
                                          ),
                                          body:TabBarView(children:_ktabpages),
                                      )   
                                    ),
                                );
                              }
}
class NewsTile extends StatelessWidget{
  final String imageUrl,title,desc,url;
  NewsTile({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(
          newsUrl: url,
        )
    ));
      },
    child: Container(
      margin: EdgeInsets.only(bottom: 16),
      child:Column(
        children: <Widget>[
          Image.network(imageUrl),
           SizedBox(height:8),
          Text(title,style:TextStyle(fontSize:17,color: Colors.black87,fontWeight: FontWeight.w600)),
          SizedBox(height:8),
          Text(desc,style: TextStyle(color:Colors.black54),),

        ],

      ),
    ));
  }

}