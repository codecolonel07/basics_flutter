import 'package:flutter/material.dart';

class Live extends StatefulWidget {
  const Live({Key? key}) : super(key: key);

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  bool valuefirst = false;
  bool valuesecond = false;
  List<String> country = ['India', 'US', 'UK', 'canada'];
  String? selected;

  void initState() {
    super.initState();
    selected = country[0]; // Initialize _selectedCountry with the first country
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: "Enter Your name",
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: "Enter Email",
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.grey,
                  ),
                ),
                Text("Select category : "),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text("category 1"),
                  subtitle: Text("abc"),
                  value: this.valuefirst,
                  activeColor: Colors.red,
                  checkColor: Colors.green,
                  tileColor: Colors.grey,
                  onChanged: (bool? newValue) {
                    setState(() {
                      this.valuefirst = newValue!;
                    });
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                CheckboxListTile(
                  // controlAffinity: ListTileControlAffinity.trailing,
                  title: Text("category 2"),
                  value: this.valuesecond,
                  activeColor: Colors.red,
                  checkColor: Colors.green,
                  onChanged: (bool? newValue) {
                    setState(() {
                      this.valuesecond = newValue!;
                    });
                  },
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Country',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.flag),
                  ),
                  items: country.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selected = value as String?;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a country';
                    }
                    return null;
                  },
                  value: selected,
                ),
                MyCardWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCardWidget extends StatefulWidget {
  const MyCardWidget({Key? key}) : super(key: key);

  @override
  State<MyCardWidget> createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title:Text("how are you"),
            leading: Icon(Icons.question_mark),
          ),
          ButtonBar(
            children: [
              ElevatedButton(onPressed:()=>{ }, child: Text("one")),
              ElevatedButton(onPressed:()=>{ }, child: Text("two")),
            ],

          ),

        ],
      ),
    );
  }
}
