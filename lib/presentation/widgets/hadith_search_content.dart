import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/strings/app_strings.dart';
import '../../data/state/hadith_data_state.dart';
import '../../domain/entitles/hadith_entity.dart';
import '../items/hadith_item.dart';
import 'error_text_data.dart';
import 'text_data.dart';

class HadithSearchContent extends StatefulWidget {
  const HadithSearchContent({super.key, required this.searchQuery});
  final String searchQuery;

  @override
  State<HadithSearchContent> createState() => _HadithSearchContentState();
}

class _HadithSearchContentState extends State<HadithSearchContent> {
  List<HadithEntity> _hadith = [];
  List<HadithEntity> _recentHadith = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HadithEntity>>(
      future: Provider.of<HadithDataState>(context)
          .fetchAllHadiths(), //передаем список хадисов
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          _hadith = snapshot.data!;
          _recentHadith = widget.searchQuery.isEmpty
              ? _hadith
              : _hadith
                  .where((element) =>
                      element.hadithNumber //поиск по номерам хадиса
                          .toLowerCase()
                          .contains(widget.searchQuery.toLowerCase()) ||
                      element.hadithTitle //поиск по их названию
                          .toLowerCase()
                          .contains(widget.searchQuery.toLowerCase()))
                  .toList();

          if (_recentHadith.isEmpty && widget.searchQuery.isNotEmpty) {
            return const TextData(text: AppString.searchIsEmpty);
          } else {
            return Scrollbar(
              child: ListView.builder(
                itemCount: _recentHadith.length,
                itemBuilder: (context, index) {
                  final HadithEntity hadithModel = _recentHadith[index];
                  return HadithItem(hadithModel: hadithModel, index: index);
                },
              ),
            );
          }
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