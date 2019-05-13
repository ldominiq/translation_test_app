import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: MyHomePage(title: 'test'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  

  List<String> sources = [
    "Hello !",
    "Username",
    "Password",
    "Please enter your login info.",
    "Username is case sensitive."
  ];
  List<String> targets = [
    "Bonjour !",
    "Nom d'utilisateur",
    "Mot de passe",
    "Veuillez entrer vos informations de connexion.",
    "Le nom d'utilisateur est sensible à la casse."
  ];
  List<String> files = [
    "ADMIN",
    "ANALYTICS",
    "OTHER"
  ];


  @override
  Widget build(BuildContext context) {
    for (var j=0; j< 10; j++){
      files.add("Files test $j");
    }

    for(var i=0; i < 100000; i++){
      if(i%10==0){
        sources.add("ok");
        targets.add("ok");
      }
      sources.add("Sources test string $i");
      targets.add("Targets test string $i");
    }
    
    final leftList = ListView.builder(
      itemCount: sources.length,
      itemBuilder: (context, index) {
        
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                
                //id
                Expanded(
                  
                  child: Center(
                    
                    child: Text('$index'),
                )),

                //sources
                Expanded(
                  flex: 5,
                  child: Column(
                    // align the text to the left instead of centered
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Text(sources[index])],
                  ),
                ),

                //targets
                Expanded(
                  flex: 5,
                  child: Column(
                    // align the text to the left instead of centered
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(targets[index]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    final body = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FlutterLogo(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Translation Test App",
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 8, 
            child: leftList),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: files.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => print(files[index]),
                  child: Card(
                    
                    child: Container(
                      height: 80,
                      child: Center(
                        child: Text(
                          files[index]),
                      )
                    )
                  )
                );
                
              },
            ),
          )
        ],
      ),
    );

    return new Container(
      child: body,
    );
  }
}
