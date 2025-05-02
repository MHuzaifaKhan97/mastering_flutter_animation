## Key Concepts:

## AnimationController

### Controls the animation (start, stop, reverse, repeat).

### Needs a TickerProvider (usually via SingleTickerProviderStateMixin).

### You manually trigger animation with .forward(), .reverse(), .repeat(), etc.

## AnimatedBuilder

### Rebuilds part of your UI based on animation values.

### Optimized — only rebuilds what's needed.

### What is TickerProviderStateMixin?

## Ticker:

### A ticker is like a metronome that “ticks” every frame (usually 60 times per second).

### It drives your AnimationController forward frame by frame.

## TickerProviderStateMixin:

### It allows your State class to act as a TickerProvider, providing the vsync argument to AnimationController.
