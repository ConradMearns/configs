# shell.nix
{ pkgs ? import <nixpkgs> {} }:
let
  my-python-packages = p: with p; [
    fire
    typer
  ];
  my-python = pkgs.python3.withPackages my-python-packages;
in my-python.env