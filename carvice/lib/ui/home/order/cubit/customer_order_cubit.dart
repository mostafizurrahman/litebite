

import 'package:carvice/domain/entity/menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customer_order_state.dart';

class CustomerOrderCubit extends Cubit<CustomerOrderState> {
  CustomerOrderCubit() : super(CustomerInitialOrderState());

  Future<void> startOrder(final List<Menu> menu) async {

  }


}