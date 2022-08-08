// Project info
import 'package:flutter/rendering.dart';

class ProjectData {
  String name;
  String description;

  String platforms;
  String mainSoftwareType;
  String mainSoftwareName;

  AssetImage thumbnail;

  String startOfProject;
  String endOfProject; // Put as '-' if still doing
  String duration; // Put as '-' if still doing

  String credits;

  List<String> tags;

  ProjectData(
      this.name,
      this.description,
      this.platforms,
      this.mainSoftwareType,
      this.mainSoftwareName,
      this.thumbnail,
      this.startOfProject,
      this.endOfProject,
      this.duration,
      this.credits,
      this.tags);

}


  final projects = [
    
    ProjectData("IWP",
        """
This is my Year 3 Independent Work Project in NYP

Main features:

- Infinite procedural terrain generation
- 2 Player classes (Warrior & Archer) with levelling system
- 2 Player co-op
- Zombie AI
      """,
        "Windows",
        "Game Engine",
        "Unity",
        const AssetImage("assets/images/IWP_Thumbnail.png"),
        "October 2020",
        "Feburary 2021",
        "17 Weeks",
        """
Credits for assets that are used:
- Models & Animations: https://www.mixamo.com/#/
- Sword Trail: https://realtimevfx.com/t/ofiicial-vfx-sketch-14-sword-trail/5060/6
- Crosshairs: https://rad-potato.itch.io/pixel-perfect-ultimate-crosshair-kit

UI Icons:
- XP Icon: https://www.flaticon.com/authors/freepik
- Health Icon: https://www.flaticon.com/authors/smashicons
- Damage Icon: https://www.flaticon.com/authors/maxicons

Audio:
Footsteps: https://www.kenney.nl/
Sword Slash: https://freesound.org/people/nextmaking/sounds/86049/
Draw Bow: https://freesound.org/people/Paveroux/sounds/490556/
Shooting Bow: https://freesound.org/people/Erdie/sounds/65733/
""",
        []),
    ProjectData("AI Game",
        """
This is a game that I made for my AI Game module's assignment.

Some of the features that were implemented:
- AI state machine for the units and the enemy AI player
- A* Pathfinding on hexagon tiles
- DFS (Explore state for the enemy AI player)
- Procedural map generation
- Visibility range (All units of each player share it)
​
Note: 
It was made with the focus of AI so the graphics, game design and controls aren't very good. 
Was also doing other other assignments during this time, so not 100% of the duration was spent on this project

Some things are unknown / unclear since the project was done long ago.
""",
        "Windows",
        "Language",
        "OpenGL, C++",
        const AssetImage("assets/images/AI_Game_Thumbnail.png"),
        "Unknown",
        "31 Jan 2021",
        "Around 5 weeks",
        "Unknown",
        []),
    ProjectData("TmpProj1",
        "description 1",
        "Windows",
        "UNITY",
        "Game Engine",
        const AssetImage("assets/images/IWP_Img_1.png"),
        "Jan 2022",
        "Feb 2022",
        "1 month",
        "-", []),
    ProjectData("TmpProj2",
        "description 2",
        "Windows",
        "UNITY",
        "Game Engine",
        const AssetImage("assets/images/IWP_Img_1.png"),
        "Jan 2022",
        "Feb 2022",
        "1 month",
        "-", []),
    ProjectData("TmpProj3",
        "description 3",
        "Windows",
        "UNITY",
        "Game Engine",
        const AssetImage("assets/images/IWP_Img_1.png"),
        "Jan 2022",
        "Feb 2022",
        "1 month",
        "-", []),
    ProjectData("TmpProj4",
        "description 4",
        "Windows",
        "UNITY",
        "Game Engine",
        const AssetImage("assets/images/IWP_Img_1.png"),
        "Jan 2022",
        "Feb 2022",
        "1 month",
        "-", []),
    ProjectData("TmpProj5",
        "description 5",
        "Windows",
        "UNITY",
        "Game Engine",
        const AssetImage("assets/images/IWP_Img_1.png"),
        "Jan 2022",
        "Feb 2022",
        "1 month",
        "-", []),
        
  ];