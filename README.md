# State Clicker

This Godot project is a simple proof of concept to show how you can manage multiple states using shared objects instead of directly referencing nodes, propagating signals through the scene tree or using global objects (autoloads/singletons).

https://github.com/williamd1k0/state-clicker/assets/10428035/1e74f8de-d36c-46f0-9ba4-6168a7eec931

## Explanation

The way I used to make my games:
![before](https://raw.githubusercontent.com/williamd1k0/state-clicker/main/devel/flowchart-before.png)

*vs* The way I'm doing it in this project:
![after](https://raw.githubusercontent.com/williamd1k0/state-clicker/main/devel/flowchart-after.png)

You can find a full explanation in this blog post: https://tumeo.space/gamedev/2023/10/18/godot-states/
