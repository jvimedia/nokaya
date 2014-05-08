# Nokaya

CLI to download photos from several online services including Instagram, Imgur albums, Flickr albums, App.net, Tumblr...

Mac OS X only for the time being.

## Installation

`gem install nokaya`

## Usage

### Instagram

`nokaya -i url`  

`nokaya -i url -n file_name`  

`nokaya -i url -n 'file name'`  

Also accepts the IFTTT format (like 'http://ift.tt/1m2Nvz8').  

Example:

`nokaya -i http://instagram.com/p/noANAfjJ7B/`  

`nokaya -i http://instagram.com/p/noANAfjJ7B/ -n happydog`

`nokaya -i http://ift.tt/1m2Nvz8 -n pasta`

### Tumblr

`nokaya -t url` 

`nokaya -t url -n file_name`  

Example:

`nokaya -t http://spacequest.tumblr.com/post/83560738152/sexycomics-carlos-valenzuela`  

`nokaya -t http://spacequest.tumblr.com/post/83560738152/sexycomics-carlos-valenzuela -n 'girl and monster'`

### Imgur album

`nokaya -ial url`

Example:

`nokaya -ial http://imgur.com/a/JNzjB\#0`

Downloads all images in the album.  

### Flickr album

`nokaya -fal url`

Example:

`nokaya -fal https://www.flickr.com/photos/ericdke/sets/72157644556227302/`

Downloads all images in the album.  

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
