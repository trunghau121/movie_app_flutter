import 'package:flutter/material.dart';
import 'package:movie_app_flutter/presentation/screen/movie_detail/movie_detail_arguments.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;
  const MovieDetailScreen({super.key, required this.movieDetailArguments});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
