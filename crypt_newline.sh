:<<">>:"
crypt_newline.sh
@param 1 Crypttab file.
@param 2 Cryptfold.
@param 3 Name for the new crypt line.
@param 4 Key for the crypttab.
@return The key.
>>:

hash="$(echo -n "$3" | sha1sum)"
touch "$2/$hash\&"
mkdir "$2/$hash\|"
target="$(mktemp)"

openssl enc -d -aes-256-cbc -in "$1" -out "$target" -pass stdin <<<"$4"
