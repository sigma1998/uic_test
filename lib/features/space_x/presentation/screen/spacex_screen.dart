import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uic_test/features/space_x/presentation/screen/spacex_bloc.dart';
import 'package:uic_test/features/space_x/presentation/screen/spacex_event.dart';
import 'package:uic_test/features/space_x/presentation/screen/spacex_state.dart';

import '../../../../app/app_colors.dart';
import '../../../widgets/progres_indicator.dart';

class SpaceXScreen extends StatelessWidget {
  const SpaceXScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SpaceXBloC>();
    return Scaffold(
      appBar: getAppBar(),
      body: BlocBuilder<SpaceXBloC, SpaceXState>(
        builder: (context, state) {
          return state is SpaceXLoaded
              ? getLoaded(state, bloc)
              : state is SpaceXLoading
                  ? getLoading(bloc)
                  : state is SpaceXEmpty
                      ? getEmpty(bloc)
                      : state is SpaceXNetworkError
                          ? getNetworkError(bloc)
                          : state is SpaceXError
                              ? getEr(bloc)
                              : getInitial(bloc);
        },
      ),
    );
  }

  getAppBar() {
    return AppBar(
      leading: const SizedBox(
        width: 24,
        height: 24,
        child: Icon(Icons.menu),
      ),
      title: const Text(
        'SpaceX',
      ),
    );
  }

  getLoaded(SpaceXLoaded state, SpaceXBloC bloc) {
    return Column(children: [
      getRow('CEO', state.spaceXModel.company?.ceo ?? "no ceo"),
      getRow('valuation', state.spaceXModel.company?.valuation.toString() ?? "no valuation"),
      getRow('name', state.spaceXModel.company?.name ?? "no name"),
    ],);
  }

  getLoading(SpaceXBloC bloc) {
    return Column(
      children: const [
        SizedBox(
          height: 150,
        ),
        CustomProgressIndicator()
      ],
    );
  }

  getEmpty(SpaceXBloC bloc) {
    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        getError('Malumot yo\'q')
      ],
    );
  }

  Widget getNetworkError(SpaceXBloC bloc) {
    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        getError('Internet ulamagan')
      ],
    );
  }

  getEr(SpaceXBloC bloc) {
    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        getError("Hatolik yuz berdi")
      ],
    );
  }

  getInitial(SpaceXBloC bloc) {
    bloc.add(SpaceXEvent());
    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        getError("Initial screen")
      ],
    );
  }
  getError(String str) {
    return Column(
      children: [
        const SizedBox(width: double.infinity,),
        Text(
          str,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.black),
        ),
      ],
    );
  }

  getRow(String leading, String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.black),
          ),
          Text(
            description,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.black),
          ),
        ],
      ),
    );
  }

}
