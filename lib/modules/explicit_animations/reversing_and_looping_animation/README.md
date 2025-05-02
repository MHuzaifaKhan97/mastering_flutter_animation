## Goal:

### Learn how to reverse and repeat animations.

### Use status listeners to create loops or ping-pong animations.

### Types of Repeats

| Behavior                  | How to Use                          |
| ------------------------- | ----------------------------------- |
| Loop Forever              | `_controller.repeat()`              |
| Loop with Reverse         | `_controller.repeat(reverse: true)` |
| Reverse After Complete    | Use `AnimationStatusListener`       |
| Animate Forward then Stop | `_controller.forward()`             |
| Animate Backward          | `_controller.reverse()`             |
