set -e

ascii_art='________                  __        ___.
\_____  \   _____ _____  |  | ____ _\_ |__
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/
                 For Pop!_OS
'

echo -e "$ascii_art"
echo "Forked from Basecamp's Omakub"
echo "=> Omakub is for fresh Pop!_OS 22.04 installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Omakub-pop_os..."
rm -rf ~/.local/share/omakub
git clone https://github.com/N4JW/omakub-pop_os.git ~/.local/share/omakub >/dev/null
if [[ $OMAKUB_REF != "master" ]]; then
  cd ~/.local/share/omakub
  git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
  cd -
fi

echo "Installation starting..."
source ~/.local/share/omakub/install.sh
