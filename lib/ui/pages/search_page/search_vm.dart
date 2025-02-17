import 'dart:async';

import 'package:dot_connect_flutter/data/remote/network_data/response/response_data.dart';
import 'package:dot_connect_flutter/data/remote/use_case/search_api_use_case.dart';
import 'package:dot_connect_flutter/ui/pages/braille_info_list_page/braille_info_list_page.dart';
import 'package:dot_connect_flutter/utils/route/route_util.dart';
import 'package:flutter/material.dart';

import '../../../entities/braille_info_page_entity.dart';

class SearchViewModel {
  void search(String keyword, BuildContext context) {
    SearchApiUseCase().searchKeyword(keyword).then((result) {
      if(result.runtimeType==NetworkErrorResp){
        print("error while searching api call : $result");

      } else if(result.runtimeType == List<TextBraillePair>) {
        RouteUtil().push(
          context,
          BrailleInfoListPage(
            appbarText: "return to search",
            textToBrailleList: result,
            titleType: TitleType.braille,
          )
        );
      }
    });
  }
}