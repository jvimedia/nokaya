# Nokaya

CLI to download photos from several online services including Instagram, App.net and Favd. 

Mac OS X only for the time being.

## Installation

`gem install nokaya`

## Usage

### Instagram

`nokaya -i url`  

`nokaya -i url -n file_name`  

Also accepts the IFTTT format (like 'http://ift.tt/1m2Nvz8').  

Example:

`nokaya -i http://instagram.com/p/noANAfjJ7B/`  

`nokaya -i http://instagram.com/p/noANAfjJ7B/ -n happydog`

`nokaya -i http://ift.tt/1m2Nvz8 -n pasta`

### Favd

`nokaya favd url` 

`nokaya favd url -n file_name`  

Example:

`nokaya favd http://pic.favd.net/29987710`  

`nokaya favd http://pic.favd.net/29987710 -n feet`

### App.net

`nokaya adn url` 

`nokaya adn url -n file_name`  

Example:

`nokaya adn https://photos.app.net/30055986/1`  

`nokaya adn https://photos.app.net/30055986/1 -n random`
