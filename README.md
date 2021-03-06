# Nokaya

CLI to download photos from several online services including Instagram, Imgur albums, Flickr albums, App.net, Tumblr pages, Photo.net, Deviantart, etc.

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

### Tumblr post

`nokaya -tu url` 

`nokaya -tu url -n file_name`  

Example:

`nokaya -tu http://spacequest.tumblr.com/post/83560738152/sexycomics-carlos-valenzuela`  

`nokaya -tu http://spacequest.tumblr.com/post/83560738152/sexycomics-carlos-valenzuela -n 'girl and monster'`

### Tumblr page

Due to the various themes and layouts existing for Tumblr galleries, this feature may not work perfectly...

Nokaya will try several techniques to extract the image links, then will fallback to scraping all available links if failing at properly detecting photos.  

`nokaya -tal url`

Example:

`nokaya -tal http://brekninger.tumblr.com`

Downloads all images in the page.  

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

### Photo.net page

`nokaya -pnet url`

Example:

`nokaya -pnet http://photo.net/gallery/photocritique/filter\?period\=365\&rank_by\=sum\&category\=Architecture\&store_prefs_p\=0`

Downloads all images in the page.  

### Deviantart gallery

`nokaya -dart url`

Example:

`nokaya -dart http://www.deviantart.com/photography/nature/waterscapes/`

Downloads all images in the gallery. 

### Imageshack user gallery

`nokaya -ishu url`

Example:

`nokaya -ishu https://imageshack.com/user/ToddGilbert`

Downloads all images in the user gallery.  

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
