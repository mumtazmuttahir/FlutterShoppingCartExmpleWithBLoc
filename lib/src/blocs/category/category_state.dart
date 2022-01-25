part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadedState extends CategoryState {
  final List<Category> categories;

  const CategoryLoadedState({this.categories = const <Category>[]});

  @override
  List<Object> get props => [categories];
}

class CategoryErrorState extends CategoryState {

  @override
  List<Object> get props => [];
}