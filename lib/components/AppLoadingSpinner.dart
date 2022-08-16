import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLoadingSpinner extends StatelessWidget {
  const AppLoadingSpinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flexible(
        fit: FlexFit.loose,
        flex: 1,
        child: CircularProgressIndicator(),
      ),
    );
  }

// For Testing Purposes
// @override
// Widget build(BuildContext context) {
//   return Center(
//     child: Column(
//       children: [
//         CircularProgressIndicator(),
//         ElevatedButton(
//             onPressed: () {
//               BlocProvider.of<FoodHomeBloc>(context).add(LoadApiEvent());
//             },
//             child: Text('LOAD AGAIN')
//         )
//       ],
//     ),
//   );
// }
}