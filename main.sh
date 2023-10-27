DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://gitlab.com/corectrl/corectrl
cp -rvf ./debian ./corectrl
cd ./corectrl

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p corectrl_1.4.1-git
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
