
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

ls ".\$package_name-win32-x64"

Move-Item -Path ".\${package_name}-win32-x64" -Destination "$build_dir\$executable_name"


}

function BuildMain {

InstallDependencies
CreateApp
BuildBinary
    

}

BuildMain



