import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/routes/route_names.dart';
import '../../core/strings/app_strings.dart';
import '../../core/style/app_styles.dart';
import '../../data/model/arguments/hadith_args.dart';
import '../../data/model/arguments/hadith_model_args.dart';
import '../../data/state/hadith_data_state.dart';
import '../../domain/entitles/hadith_entity.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({
    super.key,
    required this.hadithModel,
    required this.index,
  });

  final HadithEntity hadithModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final Color oddColor = appColors.primary.withOpacity(0.05);// разделение цвета хадисов
    final Color evenColor = appColors.primary.withOpacity(0.10);

    return ListTile(
      tileColor: index.isOdd ? oddColor : evenColor, //четный и нечетный
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.hadithDetailPage,
          
          arguments: HadithArgs(hadithId: hadithModel.id),
        );
      },
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => Padding(
            padding: AppStyles.mainPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      RouteNames.changeHadithPage,
                      arguments: HadithModelArgs(hadithModel: hadithModel),
                    );
                  },
                  child: const Text(AppString.change),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Provider.of<HadithDataState>(context, listen: false).removedHadith(hadithId: hadithModel.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(milliseconds: 350),
                        backgroundColor: appColors.secondary,
                        content: const Text(
                          AppString.removed,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                  child: const Text(AppString.remove),
                ),
              ],
            ),
          ),
        );
      },
      title: Text(
        hadithModel.hadithNumber, //передаем номер хадиса
        style: TextStyle(
          color: appColors.secondary,
          fontSize: 18,
          fontWeight: FontWeight.bold, //номера хадисов(жирный шрифт)
        ),
      ),
      subtitle: Text(
        hadithModel.hadithTitle,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Provider.of<HadithDataState>(context, listen: false).fetchAddRemoveFavorite(
            hadithId: hadithModel.id,
            favoriteState: hadithModel.favoriteState == 0 ? 1 : 0,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 350),
              backgroundColor: appColors.secondary,
              content: Text(
                hadithModel.favoriteState == 1
                    ? AppString.removedFromFavorite
                    : AppString.addedToFavorite,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        },
        icon: hadithModel.favoriteState == 0
            ? const Icon(Icons.bookmark_border)
            : const Icon(Icons.bookmark),
      ),
    );
  }
}
