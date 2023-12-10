#!/bin/sh

printf "Build on MacOS"
architecture="$(uname -p)"

if [ "$architecture" = "i386" ] ; then 
    architecture="aarch64"
fi

build_dir="build-macos-${architecture}"
echo "$build_dir"

build_nativifier_binary() {
    npm install
    npm run build

}

package_binary() {
    ls "chatbot-client-darwin-x64"
    mkdir "$build_dir"

}

build_main() {

    build_nativifier_binary
    package_binary
}

build_main



