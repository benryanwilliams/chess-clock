<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
***
***
***
*** To avoid retyping too much info. Do a search and replace for the following:
*** benryanwilliams, chess-clock, twitter_handle, email
-->





<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/benryanwilliams/chess-clock">
    <img src="Chess-Clock/Assets.xcassets/AppIcon.appiconset/1024.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Chess Clock (iOS)</h3>

  <p align="center">
    A simple two-player countdown timer with adjustable time and increments.
    <br />
    <a href="https://github.com/benryanwilliams/chess-clock"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/benryanwilliams/chess-clock">View Demo</a>
    ·
    <a href="https://github.com/benryanwilliams/chess-clock/issues">Report Bug</a>
    ·
    <a href="https://github.com/benryanwilliams/chess-clock/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)



<!-- ABOUT THE PROJECT -->
## About The Project

Following completion of Angela Yu's Swift course I decided it was time to create an app from start to finish, so here it is! Firstly, I had a think about the various activities that I enjoy, and then thought about how I could make an app relating to each those. I love a good game of chess, so decided to make a chess clock app that I could use while playing chess against my friends (and enemies).

[![Product Name Screen Shot][product-screenshot]]()

The app includes two pickers to enable the user to choose the length of time, as well as the increment for each player. Once the user has pressed 'Go' they are taken to the clock screen. The white clock is started by tapping black's side and vice versa. If either player's time reaches 30 seconds, their timer turns red, and when the timer reaches 10 seconds, tenths of a second are displayed to add some urgency to the user experience. Once the timer reaches zero, the loser's side turns red.

I had a lot of fun making this, and it's already come in handy a few times while out and about and in the presence of a chess set!

### Built With

* [Xcode 11.6](https://developer.apple.com/xcode/)
* [Swift 5.3](https://developer.apple.com/swift/)

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Installation

1. Clone the repo
```sh
git clone https://github.com/benryanwilliams/chess-clock
```


<!-- USAGE EXAMPLES -->
## Usage

Select the time and increment then tap 'Go'. Tap the black side to start white's clock, then as soon as each player has finished their turn, they should tap their side to start their opponent's clock.

Hold the 'Hold to go back' bar and tap 'Yes' to return to settings screen.


<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/benryanwilliams/chess-clock/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Ben Williams - benryanwilliams@hotmail.com

Project Link: [https://github.com/benryanwilliams/chess-clock](https://github.com/benryanwilliams/chess-clock)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/benryanwilliams/chess-clock.svg?style=flat-square
[contributors-url]: https://github.com/benryanwilliams/chess-clock/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/benryanwilliams/chess-clock.svg?style=flat-square
[forks-url]: https://github.com/benryanwilliams/chess-clock/network/members
[stars-shield]: https://img.shields.io/github/stars/benryanwilliams/chess-clock.svg?style=flat-square
[stars-url]: https://github.com/benryanwilliams/chess-clock/stargazers
[issues-shield]: https://img.shields.io/github/issues/benryanwilliams/chess-clock.svg?style=flat-square
[issues-url]: https://github.com/benryanwilliams/chess-clock/issues
[license-shield]: https://img.shields.io/github/license/benryanwilliams/chess-clock.svg?style=flat-square
[license-url]: https://github.com/benryanwilliams/chess-clock/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/ben-williams-92408aa1/
[product-screenshot]: readmescreenshot.png
