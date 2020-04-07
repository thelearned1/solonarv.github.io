---
title: Ink Magic
brew-system: fate
brew-license: ogl
---

## Overview

Ink mages learn, research, invent, and draw complex ink-patterns -- variously
called glyphs, seals, patterns, inscriptions, or graphemes -- that
produce some magical effect when activated. Ink mages are sometimes called
scribes. These ink-patterns can be inscribed
on any surface capable of holding magically active ink, but paper and
skin (via tattoos) are the most common. The ink used is made from water
and the mage’s blood (or a suitable substitute) in a simple ritual.

## Skills

### Ink Magic

Double-cost skill. Determines the difficulty level of the ink-patterns
you can work with.

### Craft (Calligraphy / Tattoing / Carving / Engraving)

Single-cost skills. These skills are not specific to ink magic; they are listed
here because they are used for the creation of ink-patterns. They are similar
enough to benefit from a [half-cost discount](concepts.html#half-cost-discount).

Most ink mages will end up using Calligraphy, because it is the easiest way
to experiment when creating or learning new ink-patterns and it is the easiest
way to keep notes.

## Patterns and Designs

A *design* is a (geometric, abstract) shape, such as "the letter A" or
"a square with a dot in the center". As an ink mage, you typically know
a number of designs as well as their effects. Each design has a complexity,
represented by a number (typically between 1 and 100).

A *pattern* is an actual physical drawing (or tattoo, or engraving, ...)
of a specific design. To be magically active, it must be created using ink
made from water or a similar solvent and a small quantity of the scribe's
blood.

### Learning and Creating Designs

Learning and creating designs happens using the same process, detailed below.

At any time an ink mage has time and equipment, they may make an Ink Magic
check against a target number equal to the complexity of the design. This
may represent working through the theory of the magical energy flows in the
design, creating a prototype, studying examples, or another appropriate activity.
As always, you may spend Fate Points to invoke narratively appropriate aspects
or reroll failures.

The resulting number of shifts is added to (if successful) or subtracted from (if
negative) a research total for that design. When the research total equals or
exceeds the design's complexity, research is finished and the ink mage has learned
that design.

The boundary between "creating" and "learning" a design is a fuzzy one. If you are
trying to recreate a design based on a few scribbles in an old book, or a glimpse
at a pattern in an enemy's stronghold, it is not clear whether you are learning
an existing design or creating a new one. This is reflected by a modifier to the
design's effective complexity for the purposes of research.

This modifier is generally determined by the GM. It should be zero when you are
working with extensive notes with many examples and detailed explanations, and is
larger the less information you have about the desired design. If you are trying
to create a new design, being clearer about the effect you want it to achieve
also helps.

#### Assistance

If another ink mage is helping you with the research full-time, they may spend Fate Points to
invoke aspects and contribute *their* Ink Magic Aspect Bonus to the roll. You may benefit from
the assistance of more than one ink mage in this way, but there are diminishing returns:
the bonus from the second assistant is halved, then divided by three, four, and so on for
each additional assistant.

Note that another ink mage spending Fate Points to assist your research is mutually exclusive
with you invoking aspects directly related to their help ("My mentor is looking over my shoulder"),
but not with invoking related but independent aspects ("Using my mentor's amazing lab").

#### Focus and Burnout

For each consecutive day spent on nothing but research and rest, you gain a +2 bonus on
the next research roll, up to 2x your Ink Magic Aspect Bonus. This bonus resets when you
make a research roll (whether it is successful or not) or when you spend a day doing
something else.

A researcher on the verge of a breakthrough may fill up narratively appropriate Consequence
slots in the physical or mental tracks -- "hasn't eaten" or "groggy", respectively --
representing all-nighters, forgotten meals, and the like. For each consequence taken, they gain
a one-time bonus to the next research roll: +1 for Mild, +3 for Moderate, +9 for Severe. The
malus from the consequence does not apply to that roll.

### Creating Patterns

#### Drawing

After you have learned a design, you are able to draw it as a pattern (or engrave it, or tattoo it, or...).
This typically takes about 5 minutes. Make a roll of the appropriate Craft skill against the
design's complexity. For this check, the GM makes a hidden roll and does not tell you the result.
If you succeed on the roll, the pattern is *accurate*. Otherwise, the pattern is *inaccurate*
and the GM notes down (secretly!) the degree of failure (number of shifts).

#### Infusing

After drawing a pattern, you have to *infuse* it before it has any effect. You carefully push
magical energy into the pattern while sensing the flows of magic inside it. Roll Ink Magic
against the design's complexity.

 - If the pattern is accurate and the infusion roll succeeded, it becomes magically active.
 - If the pattern was inaccurate and the infusion roll succeeded, and the number of success shifts
   is greater than the number of failure shifts, you manage to correct the flaws in the pattern and it becomes magically active.
 - Otherwise, add up the number of failure shifts from the Craft roll and the infusion roll (success shifts count as negative
   failure shifts). Compare this result to your Ink Magic Aspect Bonus.
   - Less or equal: the failure is minor. You may spend a Fate Point to re-roll the infusion check. If you don't,
     the pattern is ruined and a mostly-harmless magical effect occurs as the magical energy disperses.
     Examples of such effects might include a small explosion, a flash of light, or a puff of smoke.
   - Greater: the failure is major. The pattern is ruined and a significant magical effect occurs as the magical energy goes
     haywire. Anything and everything is possible here, but the significance tends to be correlated with the degree of failure.
     The magical effect is often but not always related to the intended function of the pattern.

#### Familiarity

Each time you successfully infuse a pattern, permanently reduce that design's complexity by 1.

## Stunts

### Skilled Recovery

 - Prerequisite: Ink Magic 20
 - Cost: 75 XP

When you infuse an inaccurate pattern, add your Ink Magic Aspect Bonus to the number of success shifts (failure
shifts count as negative success shifts).

### Ride the Chaos

 - Prerequisite: Ink Magic 60, Skilled Recovery
 - Cost: 500 XP

When you get a minor failure on an infusion roll, you may convert it into a major failure. When you get a major
failure on an infusion roll, you may spend a Fate Point to choose (in a general sense) the effect of the failure.
Describe it with a short sentence. Beware! The GM interprets your request.

### Stained Fingers

 - Prerequisite: Ink Magic 30
 - Cost: 150 XP

You may draw patterns on solid surfaces using nothing but your finger. When you draw a pattern this way, use Calligraphy
for the roll and take a malus equal to (design complexity / 10) rounded up. You infuse the pattern as you draw it. Make
the infusion roll as soon as you finish drawing. Patterns drawn this way last at most an hour.

### Aether Glyph

 - Prerequisite: Ink Magic 60, Stained Fingers
 - Cost: 500 XP

You may draw patterns in open space (air, vacuum, even water) with nothing but your finger. When you draw a pattern this way,
use Calligraphy for the roll and take a malus equal to (design complexity / 10) rounded up. You infuse the pattern as you
draw it. Patterns drawn this way are highly unstable and hard to infuse. For the purposes of the infusion roll, your effective
Ink Magic skill is reduced by 1/3 of your base Ink Magic skill (round down). Make the infusion roll as soon as you finish drawing.
Patterns drawn this way last at most a few minutes.

## Example designs