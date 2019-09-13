import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_train/redux/models/item.model.dart';
import 'package:redux_train/pages/list.page.dart';
import 'package:redux_train/redux/reducers/item.reducer.dart';

void main() {
  final store = Store<List<ItemModel>>(
    ItemReducers.appReducers,
    initialState: []
  );

  runApp(MyReduxApp(store));
}

class MyReduxApp extends StatelessWidget {
  final Store store;

  MyReduxApp(this.store);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Redux Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreProvider<List<ItemModel>>(
        store: store,
        child: ListPage(store)
      )
    );
  }
}