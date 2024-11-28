import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:voleiatipico/app/core/registers/get_registers.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_button.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_dropdown_positions.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_photo.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_simple_star_rating.dart';
import 'package:voleiatipico/app/core/ui/widgets/v_text_form_filed.dart';
import 'package:voleiatipico/app/modulos/players/store/create_player_store.dart';
import 'package:voleiatipico/app/modulos/players/states/create_player_state.dart';
import 'package:voleiatipico/routes.g.dart';

class CreatePlayerPage extends StatefulWidget {
  const CreatePlayerPage({super.key});

  @override
  State<CreatePlayerPage> createState() => _CreatePlayerPageState();
}

class _CreatePlayerPageState extends State<CreatePlayerPage> {
  late CreatePlayerStore createPlayerStore;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    createPlayerStore = getIt<CreatePlayerStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.yellowPrimary,
        title: Text(
          'Criar Jogador',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: AppColors.white),
        ),
      ),
      body: ValueListenableBuilder<CreatePlayerState>(
        valueListenable: createPlayerStore,
        builder: (context, state, child) {
          if (state is CreatePlayerStateError) {
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
                                loading: createPlayerStore.loading,
                                label: 'Salvar',
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await createPlayerStore.addPlayer();
                                    Routefly.navigate(routePaths.home.path);
                                  }
                                },
                              ),
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
                              hintText: 'Nome',
                              labelText: 'Nome',
                              onChanged: createPlayerStore.updateName,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: VDropdownPositions(
                                label: 'Posição',
                                onSelected: createPlayerStore.updatePosition,
                              ),
                            ),
                            Text(
                              'Nível de habilidade',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            VSimpleStarRating(
                              isReadOnly: false,
                              onRated: createPlayerStore.updateRate,
                              rating: createPlayerStore.rate,
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
        },
      ),
    );
  }
}
