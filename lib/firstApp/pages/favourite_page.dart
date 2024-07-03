import 'package:flutter/material.dart';
import 'package:testp/firstApp/provider/favourite_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context);
    final favouriteLists = provider.favourite;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 25, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "Favourite",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: favouriteLists.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Slidable(
                      endActionPane:
                          ActionPane(motion: const ScrollMotion(), children: [
                        SlidableAction(
                          onPressed: (context) {
                            favouriteLists.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: "Delete",
                        )
                      ]),
                      child: ListTile(
                        title: Text(
                          favouriteLists[index].itemname,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          favouriteLists[index].description,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage(favouriteLists[index].image),
                          backgroundColor: Colors.purple.shade300,
                        ),
                        trailing: Text(
                          '\$ ${favouriteLists[index].price}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ));
              },
            ))
          ],
        ),
      ),
    );
  }
}
