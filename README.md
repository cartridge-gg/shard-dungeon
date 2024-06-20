<picture>
  <source media="(prefers-color-scheme: dark)" srcset=".github/mark-dark.svg">
  <img alt="Dojo logo" align="right" width="120" src=".github/mark-light.svg">
</picture>

<a href="https://twitter.com/dojostarknet">
<img src="https://img.shields.io/twitter/follow/dojostarknet?style=social"/>
</a>
<a href="https://github.com/dojoengine/dojo">
<img src="https://img.shields.io/github/stars/dojoengine/dojo?style=social"/>
</a>

[![discord](https://img.shields.io/badge/join-dojo-green?logo=discord&logoColor=white)](https://discord.gg/PwDa2mKhR4)
[![Telegram Chat][tg-badge]][tg-url]

[tg-badge]: https://img.shields.io/endpoint?color=neon&logo=telegram&label=chat&style=flat-square&url=https%3A%2F%2Ftg.sumanjay.workers.dev%2Fdojoengine
[tg-url]: https://t.me/dojoengine

# Shard Dungeon

An example of a Dojo game that is a simple dungeon crawler using Saya for settlement and Katana sharding execution.

## Quick start

```bash
# Build the project.
sozo build

# The world's address may change if dojo-core is modified. Please check the Scarb.toml
# and replace as necessary. If you don't know yet the world's address, comment it.
sozo migrate apply
```

## Architecture

The idea of the demonstration is to have a metagame on Starknet, where players can register and then start a dungeon. For now, the dungeon is single player.

The shard execution must start the dungeon run, the player has to interact with the shard to effectively finish beat the dungeon's boss.

Once the dungeon is over, Saya must have all the necessary info to update the world state on the base layer.
