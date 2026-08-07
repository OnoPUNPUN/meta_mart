import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:meta_mart/features/home/presentation/bloc/home_bloc.dart';
import 'package:meta_mart/features/home/presentation/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  static const name = "/home-page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(ProductsFetched());
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients || !mounted) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final state = context.read<HomeBloc>().state;

    if (currentScroll >= maxScroll * 0.8 &&
        state is HomeLoaded &&
        !state.hasReachedEnd) {
      context.read<HomeBloc>().add(const ProductsFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Text("Hello PUNPUN", style: textTheme.headlineMedium),
              Gap(16),
              Text("All of our Products", style: textTheme.bodyMedium),
              Gap(16),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading || state is HomeInitial) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is HomeFailure) {
                      return Center(child: Text(state.message));
                    }

                    if (state is HomeLoaded || state is HomeLoadingMore) {
                      final products = state is HomeLoaded
                          ? state.products
                          : (state as HomeLoadingMore).products;

                      final isLoadingMore = state is HomeLoadingMore;
                      return GridView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.zero,
                        itemCount: products.length + (isLoadingMore ? 1 : 0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 160 / 245,
                            ),
                        itemBuilder: (context, index) {
                          if (index >= products.length) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final product = products[index];

                          return ProductCard(
                            imagePath: product.imageUrl,
                            price: product.price,
                            title: product.title,
                            subtitle: product.categoryName,
                          );
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
