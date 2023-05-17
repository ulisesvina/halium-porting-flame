# This script will install dependencies required to port Halium and create some basic files structure.

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install git gnupg flex bison gperf build-essential \
  zip bzr curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
  libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
  libgl1-mesa-dev g++-multilib mingw-w64-i686-dev tofrodos \
  python-markdown libxml2-utils xsltproc zlib1g-dev:i386 schedtool \
  liblz4-tool bc lzop imagemagick libncurses5 rsync \
  python-is-python3

mkdir -p ~/bin

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+rx ~/bin/repo
export PATH="$PATH:/home/$(whoami)/bin/"

mkdir halium && cd halium
repo init -u https://github.com/Halium/android -b halium-12.0 --depth=1

cat <<EOF > google_flame.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <remote name="android_device_google_coral" fetch="https://github.com/LineageOS" revision="lineage-20" />
    <project path="device/google/flame" name="android_device_google_coral" remote="android_device_google_coral"/>
    <project path="kernel/google/msm-4.14" name="android_kernel_google_msm-4.14" remote="android_device_google_coral" />
</manifest>
EOF
