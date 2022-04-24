## Keybase

$ keybase pgp export | gpg --import # import public key
$ keybase pgp export --secret | gpg --allow-secret-key --import # import private key

https://jamespanther.com/writings/signing-github-commits-using-keybase/

https://jamespanther.com/writings/using-keybase-for-ssh-with-gpg-agent-on-macos/

https://infertux.com/posts/2013/11/03/how-to-remove-an-email-address-from-a-gpg-key/

https://stephenreescarter.net/signing-git-commits-with-a-keybase-gpg-key/

https://www.tddapps.com/2017/01/15/how-to-use-your-keybase-key-for-ssh/

```sh
TMP_KEY_STORAGE=~/devroot/keys
mkdir -p $TMP_KEY_STORAGE
docker run -it --rm -v $TMP_KEY_STORAGE:/home ubuntu:16.04 /bin/bash

apt-get update -y
apt-get install curl monkeysphere -y
curl -O https://prerelease.keybase.io/keybase_amd64.deb
dpkg -i keybase_amd64.deb
apt-get install -f -y
rm keybase_amd64.deb

groupadd -g 1001 user_data
useradd --create-home -g user_data -u 1001 user_data
su user_data
cd /home/user_data

keybase login

# Exporting your Keybase public key to keybase.public.key
keybase pgp export -o keybase.public.key
# Exporting your Keybase private key to keybase.private.key
keybase pgp export -s --unencrypted -o keybase.private.key

# Import your Keybase public key
gpg -q --import keybase.public.key
# Import your Keybase private key
gpg -q --allow-secret-key-import --import keybase.private.key
# The key import process produces a short hexadecimal hash
# We need to extract this hash and use it to generate the RSA key
# The hash is temporarily saved into hash.key
gpg --list-keys | grep '^pub\s*.*\/*.\s.*' | grep -oEi '\/(.*)\s' | cut -c 2- | awk '{$1=$1};1' > hash.key

ENC_KEY=`cat hash.key`
echo $ENC_KEY

# Generate the RSA private key using the hexadecimal hash
# The private key will be saved in the id_rsa file
gpg --export-options export-reset-subkey-passwd,export-minimal,no-export-attributes --export-secret-keys --no-armor $ENC_KEY | openpgp2ssh $ENC_KEY > id_rsa
# Secure the private RSA key file
chmod 400 id_rsa
# Generate the public RSA key file
ssh-keygen -y -f id_rsa > id_rsa.pub

# Remove all the temporary files
rm *.key

exit
exit

chmod 400 $TMP_KEY_STORAGE/user_data/id_rsa
```
