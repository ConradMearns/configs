# configs

```bash
nixos-rebuild switch --flake .
```

```bash
nixos-rebuild --flake .#kitsault \
    --build-host conrad@kitsault.local \
    --target-host conrad@kitsault.local \
    --use-remote-sudo \
    switch
```

# zerotier

https://my.zerotier.com/network/e4da7455b2639267

# creating keys

```bash
ssh-keygen -t ed25519
```

# uploading keys

```bash
gh auth login
```

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub conrad@kitsault.local
```


# Switch repo to SSH

```bash
git remote set-url origin git@github.com:ConradMearns/.dot.git
```