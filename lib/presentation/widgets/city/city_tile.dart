import 'package:flutter/material.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';

class CityTile extends StatelessWidget {
  final String name;
  final String description;
  final VoidCallback? onTap;

  const CityTile({
    Key? key,
    this.onTap,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTap!(),
      child: Card(  
            
         color: Theme.of(context).colorScheme.secondaryContainer,
         child: Padding(padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 20.0),
              child:      Icon(
              Icons.location_city,
              size: 32,
              color: context.theme.colorScheme.onBackground,
            ),),
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, textAlign: TextAlign.left,), 
                  Text(description, textAlign: TextAlign.left,)],
              ),
        
            const Spacer(),
              Icon(            
              Icons.arrow_forward_ios,
              size: 32,
             color: context.theme.colorScheme.onBackground,
            ), 
          ],
        ),),
      ),
    );
 
  }
}
