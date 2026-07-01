import 'package:flutter/material.dart';
import 'package:fishing_hobby_app/core/theme/app_theme.dart';
import 'package:fishing_hobby_app/core/constants/app_constants.dart';
import 'package:fishing_hobby_app/presentation/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fishing_hobby_app/data/datasources/remote/remote_data_source.dart';
import 'package:fishing_hobby_app/data/repositories/fishing_repository_impl.dart';
import 'package:fishing_hobby_app/domain/repositories/fishing_repository.dart';

void main() {
  // Simple manual DI (no get_it to keep minimal)
  final remoteDataSource = RemoteDataSource(client: http.Client());
  final FishingRepository repository = FishingRepositoryImpl(remote: remoteDataSource);
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final FishingRepository repository;

  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      home: HomeScreen(repository: repository),
      debugShowCheckedModeBanner: false,
    );
  }
}
