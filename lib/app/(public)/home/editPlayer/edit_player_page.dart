// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_dropdown_positions.dart';
import 'package:voleiatipico/app/core/registers/get_registers.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_button.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_photo.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_simple_star_rating.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_text_form_filed.dart';
import 'package:voleiatipico/app/modulos/players/models/player_model.dart';
import 'package:voleiatipico/app/modulos/players/states/edit_player_state.dart';
import 'package:voleiatipico/app/modulos/players/store/edit_player_store.dart';
import 'package:voleiatipico/routes.g.dart';

class EditPlayerPage extends StatefulWidget {
  const EditPlayerPage({super.key});

  @override
  State<EditPlayerPage> createState() => _EditPlayerPageState();
}

class _EditPlayerPageState extends State<EditPlayerPage> {
  late EditPlayerStore editPlayerStore;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    editPlayerStore = getIt<EditPlayerStore>();

    final PlayerModel playerModel =
        Routefly.query.arguments ?? PlayerModel.init();
    editPlayerStore.loadData(playerModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.yellowPrimary,
        title: const Text(
          'Editar Jogador',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder(
          valueListenable: editPlayerStore,
          builder: (context, state, child) {
            if (state is EditPlayerStateError) {
              return Center(
                child: Text('Erro: ${state.message}'),
              );
            }

            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 32),
                              child: SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: VButton(
                                    label: 'Salvar',
                                    loading: editPlayerStore.loading,
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await editPlayerStore.updatePlayer();
                                        Routefly.navigate(routePaths.home.path);
                                      }
                                    }),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 32,
                              ),
                              const Center(
                                  child: VPhoto(
                                pathOfNetwork:
                                    'https://i0.wp.com/anitrendz.net/news/wp-content/uploads/2024/03/kaiju-no-8-character-visual-scaled-e1710452944157.jpg',
                                size: 150,
                              )),
                              const SizedBox(height: 32),
                              VTextFormfiled(
                                initialValue: editPlayerStore.name,
                                hintText: 'Nome',
                                labelText: 'Nome',
                                onChanged: editPlayerStore.updateName,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: VDropdownPositions(
                                  initialSelection: editPlayerStore.position,
                                  label: 'Posição',
                                  onSelected: editPlayerStore.updatePosition,
                                ),
                              ),
                              Text(
                                'Nível de habilidade',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              VSimpleStarRating(
                                isReadOnly: false,
                                onRated: editPlayerStore.updateRate,
                                rating: editPlayerStore.rate,
                                size: 50,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
