<h1 align="center"> Chatbot Client Electron App </h1> 

<p align="center">
  <a href="https://opensource.org/licenses/MIT">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-blue.svg">
  </a>

  <a href="https://github.com/soufrabi/chatbot-client/commits/master">
    <img alt="GitHub commits" src="https://img.shields.io/github/commit-activity/y/soufrabi/chatbot-client?color=red&label=commits">
  </a>

  <a href="https://github.com/soufrabi/chatbot-client/issues">
    <img alt="GitHub issues" src="https://img.shields.io/github/issues/soufrabi/chatbot-client?color=important">
  </a>
  <a href="https://github.com/soufrabi/chatbot-client/pulls">
    <img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/soufrabi/chatbot-client?color=blueviolet">
  </a>

  <a href="https://github.com/soufrabi/chatbot-client/stargazers">
    <img alt="GitHub stars" src="https://img.shields.io/github/stars/soufrabi/chatbot-client?style=social">
  </a>
</p>

## General information

As the first line suggests, this is an electron app designed to be a dedicated place to use the chatgpt web interface.

This containerization approach has several benefits:
1. You have a dedicated window for talking to chatgpt, which can be more handy
2. This, being an electron app, is using chromium and looks like an average browser for the openai website -- you get less captchas
3. If you are using an amnesic browser you do not need to relogin every time you want to use it

## Screenshots
<div align="center" style=""> 
  <img alt="screenshot1" style="max-width:40vw;" src="https://soufrabi.github.io/project-assets/chatbot-client/screenshots/login-page.png">
</div>

## Installation
The preferred way of installing this is using package managers, but if you do not wish to do it that way, skip ahead to *Build from source* section.

### Flatpak

This app is [distributed on Flathub](https://flathub.org/apps/io.github.anirbandey1.ChatbotClient),
meaning that you can install it using  the flatpak package manager by running this command, even as an unprivleged user:
```sh
flatpak install io.github.anirbandey1.ChatbotClient
```

### Build from source

#### Creating a debian binary

```sh
git clone https://github.com/soufrabi/chatbot-client.git
cd chatbot-client
./scripts/linux.sh setup
./scripts/linux.sh build-deb
cd build_binary
sudo apt install ./chatbot-client.deb
```

## Author

<a href = "https://anirbandey.net" style="text-decoration: none; color: inherit;">Anirban Dey</a>

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
