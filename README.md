# Parachain Implementer's Guide

The Parachain Implementer's Guide is still heavily work in progress and maintained by Parity.

## Live version

[**The live version**](https://w3f.github.io/parachain-implementers-guide/) is built from the source located in the official
[Polkadot repository](https://github.com/paritytech/polkadot/tree/master/roadmap/implementers-guide).

The guide is updated every hour.

## Nix Flake support

To build the latest implementers guide just run:

```
nix build github:w3f/parachain-implementers-guide --update-input polkadot
```

The result of the build the can be found in `result/html`.
