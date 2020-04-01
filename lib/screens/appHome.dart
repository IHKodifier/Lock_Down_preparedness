import 'package:flutter/material.dart';
import 'package:lockdown_response/screens/userHome.dart';
import 'package:lockdown_response/screens/violation.dart';
import 'foodSupport.dart';

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;
  int fabIndex=2;
  List<Tab> _tabs = <Tab>[];
  List<Widget> _tabViews = [];
  final List<FloatingActionButton> fabs = [null,
  null,
  FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: (){}
    
    ),
        
    ];
  
  
  
  
  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabs = [
      Tab(
        text: 'Home',
      ),
      Tab(
        child: Wrap(children: <Widget>[Text('Violations')]),
      ),
      Tab(
        text: 'Food Support',
      )
    ];
    _tabViews = [
      UserHome(),
      Violation(),
      FoodSupport(),
    ];
    _tabcontroller.addListener(_getFab);
    fabIndex = _tabcontroller.index;
  }

  void _getFab() {
    setState(() {
      fabIndex = _tabcontroller.index;
    });
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 2.0,
        title: Text(
          'Lock Down Preparedness',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: TabBar(
            tabs: _tabs,
            controller: _tabcontroller,
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).accentColor),
      ),
      body: TabBarView(children: _tabViews, controller: _tabcontroller),
      floatingActionButton: fabs[fabIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
