# Key Performance Optimization Techniques

## 1. Use RepaintBoundary

### Wrap complex animated widgets to prevent unnecessary repaints.

RepaintBoundary(
child: AnimatedContainer(...),
)

## 2. Avoid Unnecessary setState or rebuilds

### Use AnimatedBuilder or ValueListenableBuilder to only rebuild the animated part.

### Keep animation logic out of the build method.

## 3. Use const Widgets Wherever Possible

## 4. Limit Use of Shadows, Gradients, and Opacity

### These are expensive on GPU especially when animated.

### Instead of animating Opacity, prefer:

Visibility(
visible: isVisible,
child: YourWidget(),
)

### Or

FadeTransition(opacity: animation) // More efficient than AnimatedOpacity

## 5. Preload Assets (especially images)

precacheImage(AssetImage('assets/image.png'), context);

### Prevents jank during image transitions.

## 6. Use TickerMode to Pause Animations Offscreen

TickerMode(
enabled: isVisible,
child: YourAnimatedWidget(),
)

### Disables TickerProvider-based animations when widget is offscreen.

## 7. Profile with Flutter DevTools

### Use:

### Timeline → Check frame rendering time

### Repaint Rainbow → Show repaint areas

### Performance overlay (enable in app)

debugRepaintRainbowEnabled = true;

## 🔧 Additional Tips:

| Optimization Area      | Strategy                                             |
| ---------------------- | ---------------------------------------------------- |
| Large lists            | Use `ListView.builder`, `AnimatedList`               |
| Avoid Layout Thrashing | Don't animate size + layout together                 |
| Reuse Controllers      | Avoid recreating `AnimationController` unnecessarily |
| Minimal SetState       | Keep animated widget state local                     |
