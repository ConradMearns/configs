import os
import typer

def setup_nixos(hostname: str):
    print(hostname)
    os.system('hostnamectl ')

if __name__ == "__main__":
    typer.run(setup_nixos)