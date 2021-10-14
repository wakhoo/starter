import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  // 1
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2
    // TODO 1: Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        //todo: add nested list views
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          return Center(
            child: Container(
              child: const Text('Show TodayRecipeListView'),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
