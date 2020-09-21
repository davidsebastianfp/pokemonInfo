import 'package:flutter/material.dart';
import 'package:pokeinfo/constants.dart';

class DetailsPage extends StatelessWidget {
  final details;

  DetailsPage(this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(details.name),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(details.sprite_back_default),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 16,),
            Text(details.name, style: titleTextStyle.copyWith(fontSize: 24),),
            SizedBox(height: 24,),
            Text("Base experience: ${details.base_experience}", style: contentTextStyle,),
            SizedBox(height: 8,),
            Text("Height: ${details.height}", style: contentTextStyle,),
            SizedBox(height: 8,),
            Text("Weight: ${details.weight}", style: contentTextStyle,),
            SizedBox(height: 16,),
            Text("Types", style: titleTextStyle.copyWith(fontSize: 24),),
            SizedBox(height: 8,),
            Flexible(
              child: ListView.builder(
                  itemCount: details.types.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(details.types[index], style: contentTextStyle, textAlign: TextAlign.center,);
                  }),
            ),
            SizedBox(height: 8,),
            Text("Moves", style: titleTextStyle.copyWith(fontSize: 24),),
            SizedBox(height: 8,),
            Flexible(
              child: ListView.builder(
                  itemCount: details.moves.length,
                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(details.moves[index], style: contentTextStyle, textAlign: TextAlign.center,);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
