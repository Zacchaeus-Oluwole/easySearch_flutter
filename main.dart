import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String value = "";
String txt = "";
dynamic vs;


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZechX-App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  
  final myController = TextEditingController();
  

  void _setText(){
    setState(() {
      txt = value;
      dynamic v = easySearch();
      vs = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: const Text("Easy Search"),
        bottom: PreferredSize(preferredSize: const Size.fromHeight(48.0),
        child: Row(
          children: <Widget>[
            Expanded(child: Container(
              margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: TextFormField(
                onChanged: (text){
                  value = text;
                },
                controller: myController,
                decoration: const InputDecoration(
                  hintText: "Enter the first and last letter and range",
                  contentPadding: EdgeInsets.only(left: 24.0),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(onPressed: (){ _setText(); },
            icon: const Icon(Icons.search, color: Colors.white,),
          )
            ],
        
        ),
        ),
        
      ),
    
      body: Text("$vs"),

    );
  }
}

dynamic easySearch(){
  // stdout.writeln("Enter Value");
  // String? entb = stdin.readLineSync();

  dynamic dicts = {
     'ace': 'of the highest quality',
     'age': 'how long something has existed',
     'agree': 'be in accord; be in agreement',
     'abate': 'make less active or intense',
     'abatement': "an interruption in the intensity or amount of something",
     'aggregate': 'the whole amount',
     'name': 'a language unit by which a person or thing is known',
     'nice': 'pleasant or pleasing in nature',
     'nominate': 'propose as a candidate for some honor',
     'seven': "7",
     'zacchaeus': 'MY NAME LOL...'
    };

  var get = "$txt".split(' ');
  
  var first = get[0];
  var last = get[1];

  var numMin = int.parse(get[get.length -2]);
  var numMax = int.parse(get[get.length -1]);
  
  List vBag = [];

  for (dynamic dict in dicts.entries){
    
    if (dict.key[0] == first && dict.key[dict.key.length -1] == last && numMin <= dict.key.length && dict.key.length <= numMax)
    {
      vBag.add("\n");
      vBag.add(dict.key + " : " + dict.value);
      
    }  
  };

  return  vBag.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", "");
}
