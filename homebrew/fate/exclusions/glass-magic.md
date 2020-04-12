---
title: Glass Magic
brew-system: fate
brew-license: ogl
---

## Overview

Glass mages telekinetically control vitreous-phase matter (e.g. ordinary glass, obsidian,
some forms of ice). They can also force some materials to transition into vitreous phase
that wouldn't otherwise.

## Skills

### Glass Magic

Single-cost skill. Desribes the overall skill and power of your magic.

## Features

### Glass Telekinesis

You can magically lift and move loose glass near you. The finesse and power
of this telekinesis degrades the further away the glass is. Your maximum range
is normally equal to (Glass Magic * 5) meters. Your fine-control range is equal
to your Glass Magic Aspect Bonus.

The glass you control is normally divided into a *personal cloud* of pieces orbiting
or hovering inside your fine-control range, and a number of *glass clusters*. A glass cluster
consists of any number of glass pieces that are in roughly the same location and move
together. Each glass cluster orbits, hovers, or moves in a straight line or other simple
trajectory inside your range.

You can control up to (Glass Magic Aspect Bonus) clusters at a time, in addition to your
personal cloud.

A glass cluster has a maximum mass equal to (Glass Magic Aspect Bonus) kilograms. Your personal
cloud's maximum mass is (Glass Magic / 2) kilograms.

### Glass Moves

As a standard action, perform up to three actions from the below list; or perform one as a
supplemental action:

 - Change the course of one of your glass clusters.
 - Merge any number of glass clusters that are near each other into a single larger cluster.
 - Split a glass cluster into several smaller clusters.
 - Merge any number of glass clusters inside your fine-control range into your personal cloud.
 - Split off parts of your personal cloud into separate glass clusters.
 - Change the pattern of movement of the glass in your personal cloud.
 - Drop some glass from your personal cloud or any number of your glass clusters, relinquishing your
   control over it.
 - Add loose glass to an existing cluster near the glass, or nearby glass to your personal cloud.
   or pick up loose glass in an area to form a new cluster.

### Attacking

As part of a Glass Moves action, you can direct a cluster to fly at an an opponent.
Roll Glass Magic as a ranged attack, with a Range equal to your Glass Magic Aspect Bonus.
The base Weapon rating is equal to the cluster's mass in kilograms (round down).

On each of your turns, for each kilogram of glass within your personal cloud (round up),
you automatically attack all creatures (including allies!) in melee range. You can use a Glass Moves
action to exclude up to (Glass Magic Aspect Bonus) allies from this attack. Roll Glass Magic as an
attack. Note: this is not a melee attack - you are not exposed to normal counterattacks.

### Defending

On each of your turns, you may use a Glass Moves action to shift your personal cloud into a defensive
pattern. Choose Melee or Ranged. Until your next turn or until you choose a different defensive pattern,
you may add up to your Glass Magic Aspect Bonus to any defense rolls against attacks of the chosen type.
The maximum bonus is equal to the mass of your personal cloud in kilograms (round up).

## Stunts

### Vitrify

 - Requirements: Glass Magic 10
 - Cost: 50 XP

As an action, you may vitrify a chunk or cluster of appropriate material within your fine-control
range, rearranging the material's structure into a vitreous form. It counts as glass for the purposes
of your glass magic.

As an action, you may devitrify one of your glass clusters, reverting its vitreous structure to a crystalline
one. As the material is no longer glass-like, you lose control of it.

#### Appropriate materials for Vitrify

| Vitreous form | Crystalline form |
|----|----|
| Ordinary glass | quartz, sand |
| Vitreous ice | ordinary ice |

### Shattering Song

 - Requirements: Glass Magic 30
 - Cost: 150 XP

After a minute of concentration, you unleash a formidable pulse of telekinetic force. Roll Glass Magic and
note down the result (call it **X**).
All pieces of glass or other vitreous matter larger than a centimeter that are within (**X** * 50) meters shatter violently. The exploding glass sends high-velocity shards in all directions.

Any creatures near affected pieces of glass are pelted with a hail of glass shards. The glass makes an attack against
these creatures. If there was only a small amount of glass, use (**X** / 2) (round up) for the glass' attack roll. If there was a large amount of glass (e.g. standing next to a window), use **X**.

#### Modulating the effect

You cannot affect any volume other than a sphere centered on your position with the given radius. This means
you cannot choose to exclude any creatures or areas from the attack; if glass is in range. it will shatter.
It also means you cannot choose to affect a smaller area.

However, you can choose to lower your effective Glass Magic level for the purposes of this stunt, causing a weaker
effect within a smaller range.

### Fuse

 - Requirements: Glass Magic 20, Vitrify
 - Cost: 50 XP

You press the pieces of glass in a glass cluster, or a part of your personal cloud, together firmly.
Then you revitrify the entire clump, causing the glass pieces to fuse into a single object. The whole
process takes between a minute and ten minutes depending on the size of the object. Results will be
poor if the pieces are not made of the same material (e.g. attempting to fuse ice and glass).
You may also fuse glass pieces onto an existing glass object in this way, even if the object is too
large to pick up telekinetically.

### Razor Shards

 - Requirements: Glass Magic 20
 - Cost: 75 XP

You use your telekinesis to sharpen the edges of all the glass pieces in a glass cluster. This takes
seconds (a standard action) if there are only a few large pieces, up to a minute if there are many small
pieces. The glass must be inside your fine-control range. Glass sharpened this way gains a base Weapon
rating equal to your Glass Magic Aspect Bonus.

### Improved Glass Defense

 - Requirements: Glass Magic 20
 - Cost: 75 XP

When you use your personal cloud to defend, instead of adding your Glass Magic Aspect Bonus to the
defense roll, you may use Glass Magic for the defense roll.

### Razor-Sharp Revenge

 - Requirements: Glass Magic 20, Improved Glass Defense
 - Cost: 75 XP

When you use your personal cloud to defend against a Melee attack, if you win the roll and you used Improved
Glass Defense, you counterattack as if you had defended with a melee skill.

### Vitreous Armor

 - Requirements: Glass Magic 30
 - Cost: 125 XP

You gain an additional way to use your personal cloud for defense. You retract your cloud inward, forming
a solid layer of armor. As you still control the glass, you take none of the usual penalties for wearing armor.
The armor is non-ablative and grants Armor: X against all physical damage. X is the lower of your Glass
Magic Aspect Bonus, and half the mass of the armor in kilograms (round down).

### Glass Cannon

 - Requirements: Glass Magic 30
 - Cost: 125 XP

You have learned to fling glass at great speed in a straight line, allowing you to hit targets well
outside your normal range. As an action, you launch a glass cluster in a straight line, accelerating
it continuously until it leaves your range. You lose control of the cluster as soon as it leaves your
range.

Make a ranged attack using your Glass Magic skill. The range is unlimited, but you take a cumulative
penalty to the attack roll for each zone (or for every 10 meters) beyond your normal range. The total
penalty follows a quadratic progression: -3, -9, -18, -30, -45, etc. The formula is `-3*n*(n+1)/2`, where
`n` is the number of additional zones or 10-meter increments. As a reminder, your normal range is
(Glass Magic Aspect Bonus) in zones or (Glass Magic * 5) in meters.

### Autolevitation

 - Requirements: Glass Magic 40, Vitreous Armor
 - Cost: 200 XP

You are able to levitate your Vitreous Armor while wearing it, allowing you to fly or hover in place.
Use Glass Magic instead of Athletics for movement while flying this way.