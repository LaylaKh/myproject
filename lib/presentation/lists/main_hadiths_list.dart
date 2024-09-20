import 'package:flutter/material.dart';
import 'package:mykhadith/data/state/hadith_data_state.dart';
import 'package:provider/provider.dart';
import '../../domain/entitles/hadith_entity.dart';
import '../items/hadith_item.dart';
import '../widgets/error_text_data.dart';

class MainHadithsList extends StatefulWidget {
  const MainHadithsList({super.key});

  @override
  State<MainHadithsList> createState() => _MainHadithsListState();
}

class _MainHadithsListState extends State<MainHadithsList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HadithEntity>>(
      future: Provider.of<HadithDataState>(context)
          .fetchAllHadiths(), //передаем список хадисов
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Scrollbar(
            child: ListView.builder(
                itemCount: snapshot.data!.length, //длина списка хадисов
                itemBuilder: (context, index) {
                  final HadithEntity hadithModel = snapshot.data![index];
                  return HadithItem(hadithModel: hadithModel, index: index);
              }
            ),
          );
        } else if (snapshot.hasError) {
          return ErrorTextData(errorText: snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
