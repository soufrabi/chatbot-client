
Write-Host "Building on Windows"

$build_dir = "build-windows-x86_64"
$package_name = "chatbot-client"
$executable_name = "chatbot-client.exe"

function InstallDependencies {
    Write-Host "Install Dependencies"

}

function CreateApp {

npm install
npm run build



}

function BuildBinary {

New-Item -Path "$build_dir" -Type Directory

Move-Item -Path ".\dist\main.exe" -Destination "$build_dir\$executable_name"


}

function BuildMain {

InstallDependencies
CreateApp
BuildBinary
    

}

BuildMain



