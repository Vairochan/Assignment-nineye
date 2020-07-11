import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Center(
                      child: Text(
                        "Lorem Ipsum",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: getjson(),
                  builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                    if(snapshot.hasData){
                      List content = snapshot.data;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: content.length,
                                itemBuilder: (BuildContext context, int position) {
                                  return Container(
                                    child: Column(
                                      children: <Widget>[
                                        Card(
                                          elevation: 5,
                                          child: ListTile(
                                            leading: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.grey
                                              ),
                                              child: Image.network("${content[position]["picture"]}",
                                              width: 80,
                                              fit: BoxFit.contain,),
                                            ),
                                            title: Text(
                                              "\t\t ${content[position]["name"]}\n \t\tCompany: ${content[position]["company"]}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                              subtitle: ListTile(
                                                title: Text("Balance: ${content[position]["balance"]},\nAdd: ${content[position]["address"]} "),
                                                subtitle: Text("Contact: ${content[position]["phone"]} "),

                                              )

                                          ),
                                        ),

                                      ],
                                    ),
                                  );
                                },
                            ),
                          )
                        ],
                      );
                    }else{
                      return Container();
                    }
                  },
                ),
              )
            ],
          )
      ),
    );
  }

  Future<List> getjson() async {
    String apiUrl = 'http://www.json-generator.com/api/json/get/cgsMDTVpWq?indent=2';

    http.Response response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      try {
        print(response.body);

        return json.decode(response.body);
      } catch (e) {
        print(e);
      }
    } else {
      print(response.statusCode);
    }
  }
}
