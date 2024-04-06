// import 'dart:developer';
//
// import 'package:bloc_test_app/data/repo/search_repo.dart';
// import 'package:bloc_test_app/presentation/pages/search_page/bloc/search_bloc.dart';
// import 'package:bloc_test_app/utils/textfields.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../current_dialog_page/bloc/current_chat_bloc.dart';
//
// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SearchBloc(),
//       child: BlocBuilder<SearchBloc, SearchState>(
//         builder: (context, state) {
//           return Scaffold(
//             backgroundColor: Colors.white12,
//             appBar: AppBar(
//               backgroundColor: Colors.transparent,
//               actions: [
//                 CustomTextFormField(
//                   onChanged: (text) {
//                     if (text != "") {
//                       context.read<SearchBloc>().add(FetchProfiles(name: text));
//                     } else {
//                       context.read<SearchBloc>().add(TryToFetchEmptyText());
//                     }
//                   },
//                   onSaved: (text) {
//                     if (text != "") {
//                       context.read<SearchBloc>().add(FetchProfiles(name: text));
//                     } else {
//                       context.read<SearchBloc>().add(TryToFetchEmptyText());
//                     }
//                   },
//                   inputAction: TextInputAction.send,
//                   obscuringPass: false,
//                   height: 50,
//                   width: 300,
//                   labelText: "Введите имя пользователя",
//                   hintText: Colors.grey,
//                   cursorHeight: 30,
//                   cursorColor: Colors.white,
//                   inputType: TextInputType.text,
//                   textColor: Colors.white,
//                 ),
//                 const SizedBox(
//                   width: 50,
//                 ),
//               ],
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             body: Column(
//               children: [
//                 const Divider(
//                   color: Colors.grey,
//                   thickness: 2,
//                   indent: 0,
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                       itemCount: state.accounts?.results.length ?? 0,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(
//                               left: 15, top: 5, bottom: 5),
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => CurrentDialog(
//                                     userId:
//                                         state.accounts!.results[index].username,
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: SizedBox(
//                               height: 70,
//                               child: Row(
//                                 children: [
//                                   const CircleAvatar(
//                                     radius: 25,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 20),
//                                     child: Text(
//                                       state.accounts!.results[index].username,
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
