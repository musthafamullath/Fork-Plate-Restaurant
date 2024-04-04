import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/profile/profile_bloc.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import '../../../../utils/text_styles.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width * 10 / 10,
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            color: orangePointShade800,
            width: 10,
          ),
        ),
        backgroundBlendMode: BlendMode.srcATop,
        color: orangePointWithblue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Stack(
        children: [
          FadeInDownBig(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 55, 25, 0),
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Hello, Welome  ',
                          style: bigBoldWhite,
                        ),
                        TextSpan(
                          text: state.profile?.name ??
                              "Restaurant Name",
                          style: bigBoldWhite,
                        ),
                        const TextSpan(
                          text: " . . .",
                          style: bigBoldWhite,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
