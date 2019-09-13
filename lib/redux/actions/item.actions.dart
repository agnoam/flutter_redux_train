import 'package:redux_train/redux/models/item.model.dart';

class ToggleItemStateAction {
  final ItemModel item;

  ToggleItemStateAction(this.item);
}

class DeleteItemAction {
  final ItemModel item;

  DeleteItemAction(this.item);
}

class AddItemAction {
  final ItemModel item;
  
  AddItemAction(this.item);
}