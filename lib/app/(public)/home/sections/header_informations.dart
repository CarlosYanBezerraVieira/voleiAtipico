import 'package:flutter/material.dart';
import 'package:voleiatipico/app/core/ui/theme/app_colors.dart';

class HeaderInformations extends StatefulWidget {
  const HeaderInformations({
    super.key,
  });

  @override
  State<HeaderInformations> createState() => _HeaderInformationsState();
}

class _HeaderInformationsState extends State<HeaderInformations> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
      onExpansionChanged: (value) {
        setState(() {
          isExpanded = value;
        });
      },
      collapsedBackgroundColor: AppColors.yellowPrimary,
      collapsedTextColor: AppColors.white,
      textColor: AppColors.white,
      collapsedIconColor: AppColors.black,
      backgroundColor: AppColors.yellowLite,
      visualDensity: VisualDensity.compact,
      title: Text(
        'Informações',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      children: [
        isExpanded
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      height: 1,
                      color: AppColors.yellowPrimary,
                      thickness: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dia',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Domingo',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Horários',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '19 às 21h',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      height: 1,
                      color: AppColors.yellowPrimary,
                      thickness: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Membros',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '18 ',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Local',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'RR',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      height: 1,
                      color: AppColors.yellowPrimary,
                      thickness: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pix',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '(88)99385223',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Responsável',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Rafael Rodrigues',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    height: 1,
                    color: AppColors.yellowPrimary,
                    thickness: 2,
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
