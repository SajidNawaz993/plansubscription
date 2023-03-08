import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plansubscription/features/plan_detail/bloc/plans_details_bloc.dart';
import 'package:plansubscription/features/view/plans_widget.dart';

import 'core/config/colors.dart';
import 'features/bloc/plans_bloc.dart';
import 'features/data/plans_repository.dart';


void main() async {
  // initialize flutter widget
  // must needed to communicate with native code and also firebase needs it
  WidgetsFlutterBinding.ensureInitialized();
  ///  calling dependencies setting for get_it
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // Login Repository
        RepositoryProvider<PlansRepository>(
          create: ((context) => PlansRepository()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // Login Bloc
          BlocProvider<PlansBloc>(
            create: (context) => PlansBloc(
              repository: context.read<PlansRepository>(),
            ),
          ),
          BlocProvider<PlanDetailsBloc>(
            create: (context) => PlanDetailsBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MN Atelier',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: AppColors.white,
              secondary: AppColors.black,
            ),
          ),
          home: PlansWidget(),
        ),
      ),
    );
  }

}

// Text(
// widget.featuredModel.eventTitle,
// style: Theme.of(context).textTheme.bodyText2!
// .copyWith(  fontSize: width >= 1201
// ? 22
// : width >= 601
// ? 20
// : width >= 400
// ? 16
//     : 14),
// ),

//https://github.com/csedeepakyadav/local-json-parsing-with-futurebuilder/blob/master/pubspec.yaml