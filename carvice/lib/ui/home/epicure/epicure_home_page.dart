
import 'package:carvice/ui/home/epicure/cubit/epicure_cubit.dart';
import 'package:carvice/ui/home/epicure/widgets/epicure_home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter/material.dart';

import 'cubit/epicure_states.dart';



class EpicureHomePage extends StatefulWidget {
  const EpicureHomePage();

  @override
  State<StatefulWidget> createState() {
    return _EpicureHomeState();
  }
}

class _EpicureHomeState extends State<EpicureHomePage> {
  final _epicureCubit = EpicureCubit();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _epicureCubit.getEpicureBy(userID: 'mostafizur.cse@gmail.com');
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text('Restaurants'),
          ),
          Expanded(
            child: BlocBuilder(
              bloc: _epicureCubit,
              builder: _buildEpicure,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEpicure(
      final BuildContext ctx,
      final EpicureState state,
      ) {
    if (state is EpicureListErrorState) {
      return Container(
        child: Center(
          child: Text('error occurred! ${state.reason}'),
        ),
      );
    }
    if (state is EpicureInfState) {
      return EpicureHomeView(epicure: state.epicure);
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}
