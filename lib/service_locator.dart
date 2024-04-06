import 'package:get_it/get_it.dart';
import 'package:sprout_technical_exam/features/pagination/bloc/pagination_bloc.dart';
import 'package:sprout_technical_exam/features/products/bloc/product_bloc.dart';
import 'package:sprout_technical_exam/theme/theme_bloc.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<ThemeBloc>(ThemeBloc());
  getIt.registerSingleton<ProductBloc>(ProductBloc());
  getIt.registerSingleton<PaginationBloc>(PaginationBloc());
}
