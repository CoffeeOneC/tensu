## Data decryption

For the bot to work, it requires config.env with its data

To decrypt, use (and then enter a passphrase):

```
gpg -d config.env.gpg > config.env
```

## Setup automated security checks

To prevent accidental token (and other sensitive data) leaks, install [git secrets](https://github.com/awslabs/git-secrets) and set up it (in repo's root directory):

```
git secrets --install
git secrets --register-aws
git secrets --add '[0-9]{10}:[a-zA-Z0-9_]{35}'
git secrets --add "password='.{6,}'"
```
