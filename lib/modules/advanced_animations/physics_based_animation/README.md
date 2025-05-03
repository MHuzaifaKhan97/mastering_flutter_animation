## Goal:

### Use physics simulations to create natural motion effects (like spring, gravity, friction).

### Understand SpringSimulation, FrictionSimulation, and BouncingScrollSimulation.

### What Are Physics-Based Animations?

### Instead of defining start and end points with durations, you let physics drive the animation behavior — just like real-world motion.

## Key Classes

| Class                | Purpose                            |
| -------------------- | ---------------------------------- |
| `SpringSimulation`   | Simulates spring motion (bouncy)   |
| `FrictionSimulation` | Decelerates over time (e.g. fling) |
| `ScrollSimulation`   | Used in custom scroll behaviors    |

## Simulation Parameters

| Parameter   | Description                    |
| ----------- | ------------------------------ |
| `mass`      | How heavy the object feels     |
| `stiffness` | Higher = snappier              |
| `damping`   | Resistance (low = more bouncy) |

## Use Cases:

### Bounce effects

### Inertia/fling effects

### Over-scroll effects

### Complex gesture-driven animations
