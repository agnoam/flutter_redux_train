import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_train/redux/actions/item.actions.dart';
import 'package:redux_train/addition/ui.lib.dart';
import 'package:redux_train/redux/models/item.model.dart';

class ListPage extends StatelessWidget {
  final Store store;

  ListPage(this.store);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux train'),
      ),
      body: StoreConnector<List<ItemModel>, List<ItemModel>>(
        converter: (store) => store.state,
        builder: (context, list) {
          if(list.length > 0) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, position) {
                ItemModel listItem = list[position];

                return ListTile(
                  title: Text(listItem.title),
                  leading: GestureDetector(
                    child: listItem.icon,
                    onTap: () => store.dispatch(DeleteItemAction(listItem))
                  ),
                  trailing: Checkbox(
                    value: listItem.checked,
                    onChanged: (value) {
                      store.dispatch(ToggleItemStateAction(listItem));
                    }
                  )
                );  
              }
            );
          } else {
            return Center(
              child: Text('There is no items to show')
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          UI.prompt(context, 'Add new item', "What it's your wish", 'My wish...').then((title) {
            if(title.isNotEmpty) {
              store.dispatch(
                AddItemAction(ItemModel(
                  title: title,
                  icon: Icon(Icons.close)
                ))
              );
            } else {
              UI.showAlert('You cannot add empty wish', context);
            }
          });       
        }
      )
    );
  }
}