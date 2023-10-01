import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ContainerData> containers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container List App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    containers.add(ContainerData());
                  });
                },
                child: Text('Add Container'),
              ),
            ),
            Column(
              children: containers.asMap().entries.map((entry) {
                final index = entry.key;
                final containerData = entry.value;

                return ContainerItem(
                  data: containerData,
                  onEdit: () {
                    setState(() {
                      containers[index].isEditing = !containers[index].isEditing;
                    });
                  },
                  onDelete: () {
                    setState(() {
                      containers.removeAt(index);
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerData {
  String textField1 = '';
  String textField2 = '';
  String dropdownValue = 'Option 1';
  bool isEditing = false;
}

class ContainerItem extends StatefulWidget {
  final ContainerData data;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  ContainerItem({
    required this.data,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  _ContainerItemState createState() => _ContainerItemState();
}

class _ContainerItemState extends State<ContainerItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            if (!widget.data.isEditing)
              Column(
                children: [
                  TextFormField(
                    initialValue: widget.data.textField1,
                    decoration: InputDecoration(labelText: 'Text Field 1'),
                  ),
                  TextFormField(
                    initialValue: widget.data.textField2,
                    decoration: InputDecoration(labelText: 'Text Field 2'),
                  ),
                  DropdownButton<String>(
                    value: widget.data.dropdownValue,
                    onChanged: (newValue) {
                      widget.data.dropdownValue = newValue!;
                    },
                    items: <String>[
                      'Option 1',
                      'Option 2',
                      'Option 3',
                      'Option 4'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.data.isEditing = true;
                          });
                        },
                        child: Text('OK'),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: widget.onDelete,
                      ),
                    ],
                  ),
                ],
              )
            else
              Column(
                children: [
                  Text('Text Field 1: ${widget.data.textField1}'),
                  Text('Text Field 2: ${widget.data.textField2}'),
                  Text('Dropdown Value: ${widget.data.dropdownValue}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.data.isEditing = false;
                          });
                        },
                        child: Text('Edit'),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: widget.onDelete,
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
