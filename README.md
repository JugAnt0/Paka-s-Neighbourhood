# 🏘️ Paka’s Neighbourhood

**Paka’s Neighbourhood** is a 2D game built with **Godot Engine** using **GDScript**.  
The project is structured around a hub-based neighborhood where the player selects characters (cats), enters houses, and plays multiple genre-distinct minigames. Progression is unified through a shared **currency system (“fish”)**, global scene memory, and reusable UI components.

This project emphasizes **systems thinking**, **scene architecture**, and **state management** rather than a single linear gameplay loop.

---

## 🎮 Core Gameplay Loop

1. Start the game  
2. Enter the neighborhood hub  
3. Select a character  
4. Choose a minigame  
5. Play and earn fish  
6. Unlock new content  
7. Return seamlessly to previous scenes  

---

## 🧭 Scene Map (High-Level Flow)

start_game.tscn
|
v
game.tscn <-----------------------------+
| |
| |
v |
characters.tscn |
| |
+-----------------------------+--------+
| |
v v
panda_minigame_selection flora_minigame_selection
| |
v v
panda_automatic_platformer flora_sky_high
| |
v v
death_scene death_scene
| |
+------------- go_back -------+
|
v
game.tscn


*(Bellist and Shany follow the same structural pattern.)*

---

## 🗂️ Scene Breakdown

### Core / Navigation

- **`start_game.tscn`**  
  Main menu entry point. Routes to the game hub or info/tutorial scenes.

- **`game.tscn`**  
  Central hub of the project. Manages:
  - House selection
  - Character access
  - GUI overlay
  - Scene transitions
  - Shared systems (currency, memory)

- **`fade_transition.tscn`**  
  Handles smooth visual transitions between scenes.

---

### Character System

- **`characters.tscn`**  
  Character selection menu displaying all playable cats and locked content.

- **Character display scenes**
  - `panda.tscn`
  - `flora.tscn`
  - `bellist.tscn`
  - `shany.tscn`

Each contains animations and interaction logic for the character.

---

### Minigame Selection

Each character has a dedicated minigame selection scene:

- `panda's_minigame_selection.tscn`
- `flora's_minigame_selection.tscn`
- `bellist's_minigame_selection.tscn`
- `shanny's_minigame_selection.tscn`

These scenes:
- Display available minigames
- Use fish currency to lock/unlock content
- Share GUI and navigation components

---

### Minigames

Each character features a **distinct gameplay genre**.

#### 🐼 Panda — Automatic Platformer
- `panda's_automatic_platformer.tscn`
- Auto-scrolling platformer with hazards and moving platforms  
- Death handled by:
  - `panda's_automatic_platformer's_death_scene.tscn`

#### 🌸 Flora — Vertical Jumper
- `flora's_sky_high.tscn`
- Vertical movement and precision jumps  
- Death handled by:
  - `flora's_sky_high_death_screen.tscn`

#### ⚫ Bellist — Rain Dodge
- `bellist's_rain_dodge.tscn`
- Survival / dodge-based minigame  
- Death handled by:
  - `node_2d_bellist's_rain_dodge_death_scene.tscn`

#### 🟠 Shany — Jump-Queen-Style Platformer
- `shany's_jump_queen.tscn`
- High-precision platforming with strong punishment mechanics

---

## 🐟 Currency System

- **`fish.tscn`**  
  Collectible currency object.

- **`fish_manager.tscn`**  
  Global currency manager responsible for:
  - Tracking fish count
  - Unlocking minigames
  - Synchronizing GUI across scenes

The currency system persists across all minigames and menus.

---

## 🏠 Environment & Houses

- Exterior:
  - `red_house.tscn`

- Interiors:
  - `indoor_red_house.tscn`
  - `indoor_blue_house.tscn`
  - `edificio_indoor.tscn`

Supporting prop scenes:
- `door.tscn`
- `candle.tscn`
- `lightbulb.tscn`

Lighting and interaction logic are handled per scene.

---

## 🧠 Tutorial & Info

- **`tutorial.tscn`**  
  Interactive onboarding using camera cues and UI prompts.

- **`info.tscn`**  
  Information and help screen accessible from the main menu.

---

## 🛠️ Technical Highlights

- Scene-based architecture with reusable components  
- Global scene memory for consistent navigation  
- Shared currency system across independent minigames  
- Custom camera behaviors per gameplay style  
- Reusable parallax backgrounds  

---

## 🚀 Future Improvements

- Save/load system  
- Audio polish per minigame  
- Difficulty scaling  
- Scene consolidation into prefabs  
- Exported builds (desktop / web)

---

## 👤 Author

**Antonio Canale**  
Built with Godot and GDScript as a systems-focused game project.
