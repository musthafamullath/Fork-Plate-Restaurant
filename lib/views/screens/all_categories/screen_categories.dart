import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/category/category_bloc.dart';
import 'package:foodie_fly_restaurant/views/screens/add_dishes/screen_add_dishes.dart';
import 'package:foodie_fly_restaurant/views/screens/category/widget/action_screen_category.dart';
import 'package:foodie_fly_restaurant/views/screens/home/widgets/floating_action_btn.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/app_bar_widget.dart';

class ScreenAllCategories extends StatelessWidget {
  const ScreenAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<CategoryBloc>().add(CategoryEvent());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarWidget(title: "All Categories"),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ActionScreenCategory(category: state.categories[index],),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 15),
                 
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        state.categories[index].iconUrl!,
                        height: height * 1.7/ 10,
                        width: width,
                      ),
                      
                      Text(
                        state.categories[index].name!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return FloatingActionBTN(
              string: 'Add Dish',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScreenAddDishes(
                      categories: state.categories,
                      operatior: Operatior.add,
                    ),
                  ),
                );
              },
              icon: Icons.add);
        },
      ),
    );
  }
}
