import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:meta_mart/features/search/presentation/bloc/search_bloc.dart';
import 'package:meta_mart/features/search/presentation/widgets/category_container.dart';

class SearchProductsPage extends StatefulWidget {
  const SearchProductsPage({super.key});

  @override
  State<SearchProductsPage> createState() => _SearchProductsPageState();
}

class _SearchProductsPageState extends State<SearchProductsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchBloc>().add(GetCategoriesEvent());
    });
    super.initState();
  }

  final _searchTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              TextField(
                controller: _searchTEController,
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              Gap(32),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading || state is SearchInitial) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is SearchFailure) {
                      return Center(child: Text(state.message));
                    }

                    if (state is SearchLoaded) {
                      final categories = state.category;
                      return ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];

                          return CategoryContainer(categoryName: category.name);
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
