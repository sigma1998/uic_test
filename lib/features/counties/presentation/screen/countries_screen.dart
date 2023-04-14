
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uic_test/app/app_colors.dart';
import 'package:uic_test/features/counties/presentation/screen/countries_bloc.dart';
import 'package:uic_test/features/counties/presentation/screen/countries_event.dart';
import 'package:uic_test/features/counties/presentation/screen/countries_state.dart';
import 'package:uic_test/features/widgets/progres_indicator.dart';

class CountriesScreen extends StatelessWidget {
  late TextEditingController textEditingController;

  CountriesScreen({super.key}) {
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CountriesBloc>();
    return Scaffold(
      appBar: getAppBar(),
      body:
          BlocBuilder<CountriesBloc, CountriesState>(builder: (context, state) {
        return state is CountriesLoaded
            ? getLoaded(state, bloc)
            : state is CountriesLoading
                ? getLoading(bloc)
                : state is CountriesEmpty
                    ? getEmpty(bloc)
                    : state is CountriesNetworkError
                        ? getNetworkError(bloc)
                        : state is CountriesError
                            ? getEr(bloc)
                            : getInitial(bloc);
      }),
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
        'Country',
      ),
    );
  }

  getTextField(Bloc bloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: textEditingController,
          )),
          InkWell(
              onTap: () {
                if (textEditingController.text.isEmpty) return;
                bloc.add(CountrySearchEvent(
                    code: textEditingController.text.toString()));
              },
              child: const SizedBox(
                child: Icon(Icons.search),
              ))
        ],
      ),
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

  getError(String str) {
    return Text(
      str,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.black),
    );
  }

  getLoaded(CountriesLoaded state, CountriesBloc bloc) {
    return Column(
      children: [
        getTextField(bloc),
        getRow('name: ', state.data.country?.name ?? 'No name'),
        getRow('emoji: ', state.data.country?.emoji ?? 'No name'),
        getRow('currency: ', state.data.country?.currency ?? 'No name'),
        getRow('native language: ',
            state.data.country?.languages?[0].name ?? 'No name'),
        getRow('native language: ',
            state.data.country?.languages?[0].name ?? 'No name'),
        getRow('native language: ',
            state.data.country?.languages?[0].name ?? 'No name'),
      ],
    );
  }

  getLoading(CountriesBloc bloc) {
    return Column(
      children: [
        getTextField(bloc),
        const SizedBox(
          height: 150,
        ),
        const CustomProgressIndicator()
      ],
    );
  }

  Widget getEmpty(CountriesBloc bloc) {
    return Column(
      children: [
        getTextField(bloc),
        const SizedBox(
          height: 150,
        ),
        getError('Malumot yo\'q')
      ],
    );
  }

  Widget getNetworkError(CountriesBloc bloc) {
    return Column(
      children: [
        getTextField(bloc),
        const SizedBox(
          height: 150,
        ),
        getError('Internet ulamagan')
      ],
    );
  }

  Widget getEr(CountriesBloc bloc) {
    return Column(
      children: [
        getTextField(bloc),
        const SizedBox(
          height: 150,
        ),
        getError("Hatolik yuz berdi")
      ],
    );
  }

  Widget getInitial(CountriesBloc bloc) {
    return Column(
      children: [
        getTextField(bloc),
        const SizedBox(
          height: 150,
        ),
        getError("Malumot kiriting")
      ],
    );
  }
}
