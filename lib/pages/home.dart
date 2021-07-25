import 'package:flutter/material.dart';

import 'package:app_socket_flutter/models/band.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Bon Jovi', votes: 2),
    Band(id: '3', name: 'Sum41', votes: 5),
    Band(id: '4', name: 'blick182', votes: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('band'),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) =>
            _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: () {
          addNewBand();
        },
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        print('Eliminado');
      },
      background: Container(
        padding: EdgeInsets.only(left: 8),
        color:Colors.red,child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Eliminar')),),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name.substring(0, 2)),
        ),
        title: Text(band.name),
        trailing: Text(band.votes.toString(), style: TextStyle(fontSize: 20)),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  addNewBand() {
    final TextEditingController textEditingController =
        new TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('New band name'),
              content: TextField(
                controller: textEditingController,
              ),
              actions: [
                MaterialButton(
                    child: Text('add'),
                    elevation: 5,
                    onPressed: () {
                      print(textEditingController.text);
                      if (textEditingController.text.length > 1) {
                        this.bands.add(new Band(
                            id: DateTime.now().toString(),
                            name: textEditingController.text,
                            votes: 0));
                        setState(() {});
                      }
                      Navigator.of(context).pop();
                    }),
              ],
            ));
    print('??');
  }
}
