---
title: Water Magic
brew-system: fate
brew-license: ogl
---

## Skills

### Half-cost discount

Purchasing a level in a Water Magic skill costs 50% less XP if the new level is
less than your highest Water Magic skill level.

### Water Storage

Single-cost skill. Determines the size of the water mage's reservoir.
The reservoir can hold `10 * WaterStorage^2` liters of water. Example values:

| Water Storage level | XP cost | Storage capacity |
|---------------------|---------|------------------|
| 1                   |       1 | 10 l |
| 10                  |      55 | 1000 l (1 m^3) |
| 20                  |     210 | 4000 l (4 m^3) |
| 30                  |     465 | 9000 l (9 m^3) |
| 40                  |     820 | 16000 l (16 m^3) |
| 50                  |    1275 | 25000 l (25 m^3) |
| 60                  |    1830 | 36000 l (36 m^3) |
| 70                  |    2485 | 49000 l (49 m^3) |
| 80                  |    3240 | 64000 l (64 m^3) |
| 90                  |    4095 | 81000 l (81 m^3) |

### Water Portal Mastery

Single-cost skill. Determines how quickly and precisely the water mage can
create, move, and alter their water portals. Also determines the number of
portals that can be active at once. The maximum number of active portals is
`1 + WaterPortalMastery / 10`, rounded down.

## Actions

### Manipulate Water Portal

Use time: 1 Supplemental.

Create, move or alter a water portal on your skin.

### Attack option: Water Cannon

You use an existing water portal to shoot a blast of water. Uses 1 l of water
from your reservoir.

## Stunts

### Lingering Portals

Prerequisite: Water Portal Mastery 20
Cost: 100 XP

You can slide a water portal from your skin onto a surface you touch.
The portal attaches to that surface and remains active. It lasts for
`WaterPortalMastery / 2` minutes or until you reclaim it by touching it again.
While the portal is attached to the surface, you cannot control it
unless you are touching it. Touching the portal renews its duration.

### Flexible Portals

Prerequisite: Water Portal Mastery 20
Cost: 50 XP

Your water portals can exist at a distance of up to `WaterPortalMastery / 10` cm
from your skin, can be at any angle to your skin, and can be simple curved surfaces
(they do not have to be flat).