import 'package:redux_train/redux/actions/item.actions.dart';
import 'package:redux_train/redux/models/item.model.dart';

class ItemReducers {
  static List<ItemModel> appReducers(List<ItemModel> items, dynamic action) {
    
    if (action is AddItemAction) {
      return addItem(items, action);
    } else if (action is ToggleItemStateAction) {
      return toggleItem(items, action);
    } else if(action is DeleteItemAction) {
      return deleteItem(items, action);
    }

    return items;
  }

  // action = new state
  static List<ItemModel> addItem(List<ItemModel> state, dynamic action) {
    state.add(action.item);
    return state;
  }

  static List<ItemModel> toggleItem(List<ItemModel> state, dynamic action) {
    int actionToChangeI = state.indexOf(action.item);
    state[actionToChangeI].checked = !state[actionToChangeI].checked;

    return state;
  }

  static List<ItemModel> deleteItem(List<ItemModel> state, dynamic action) {
    state.remove(action.item);
    return state;
  }
}