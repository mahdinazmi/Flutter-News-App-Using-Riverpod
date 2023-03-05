import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_using_riverpod/providers/news_provider.dart';

class SearchField extends ConsumerWidget {
  const SearchField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Debouncer _debouncer = Debouncer();
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
            )
          ]
        ),
        child: TextField(
          onChanged: (value) {
            _debouncer.run(() {
              if (value.isNotEmpty) {
                ref.read(newsProvider.notifier).loadSearchedNews(value);
              } else {
                ref.read(newsProvider.notifier).loadNews();
              }
            });
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
              hintText: 'Search News',
              hintStyle: const TextStyle(
                  color: Color(0xffDDDADA),
                  fontSize: 14
                ),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                )
          ),
        ),
    );
  }
}

class Debouncer {
  final int milliseconds;

  Timer? _timer;

  Debouncer({this.milliseconds=500});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}