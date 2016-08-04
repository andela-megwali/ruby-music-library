# Ruby Music Library

## Overview

This is a command line music library application that parses a directory/folder of MP3 files and imports them to the music library. It uses the MP3 filenames to categorise them by `Song name`, `Artist`, and `Genre`. It also provides an interactive command line user interface to perform operations like browsing, listing or filtering songs by `Song name`, `Artist`, or `Genre`.


## Functions and Features

The user is able to perform the following operations in the application:

-> List all the songs in the music library

-> Get full information about a song's name, artist and genre

-> List all the artists whose songs are stored in the music library

-> List all the song genres available in the music library

-> Play any song selected by song number from the song catalog

-> List all songs with corresponding genre belonging to any artist of interest

-> Lists all songs with corresponding artist of any genre of interest

-> Get a help menu at any time

-> Follow colour-highlighted interactive instructions per input/command


## Instructions for Getting Started

You will require a basic understanding of "Git" and the "Command Line Interface" to use this application. 
You also need access to a steady internet connection.

### Installation

-> Clone the repo to a directory on your local machine using git clone command as shown below:

    $  git clone https://github.com/andela-megwali/ruby-music-library.git

-> Get into the ruby-music-library directory:

    $  cd ruby-music-library
    
-> Install dependencies

    $  bundle install

### Using the Application

-> To start the application, run bin/musiclibrary from ruby-music-library directory:
    
    $  cd ruby-music-library

    $  bin/music_library

-> The help menu is displayed at startup as shown below.
   It shows you the relevant commands/actions you can perform in the application.
   Follow the interactive prompts and will be well.


'>>>>>>>>>>>>>  Welcome to The Mic music library  <<<<<<<<<<<<<<<

Below is a list of commands to perform actions in the library:
**********************************************************************
->  list songs

Lists all the songs in the music library


->  list artists

Lists all the artists whose songs are in the music library


->  list genres

Lists all the song genres available in the music library


->  play song

Lists all songs in the library and plays any selected song number


->  list artist

Lists all songs with corresponding genre of any selected artist


->  list genre

Lists all songs with corresponding artist in any selected genre


->  help

Presents this command/action menu at any time


->  exit

Exits the music library

**********************************************************************

Type a command below to perform an action or exit:


### Colour Scheme

-> Yellow: Prompts or guides you to do something. Please pay attention to this prompt.

-> White: Mostly to give further description or provide feedback.

-> Cyan/Blue: Presents a list of results matching your queries. It also highlights the commands you can perform in the application.

-> Green: Displays welcome message, highlights when a song is being played or when a filter has been applied.

-> Red: Highlights a user error, a possible exception that might require further action or exiting of the application. 


### Developer Option: Running Test Mode

To test the application based on the specifications, run 'bundle exec rspec' from the ruby-music-library directory after you have installed all the dependencies i.e. using 'bundle install' as previously described.

    $  bundle exec rspec

The application should pass all 70 test cases.


### Limitations of the Application

This is a simple and minialistic CLI music library which has its limitations. They include:

-> The music library can only handle MP3 files i.e. files ending in ".mp3"

-> Your mp3 files must be saved in ruby-music-library/db/mp3s directory (path) to be recognised by the application

-> Your mp3 files MUST be named in the format "artist name" - "song name" - "genre"

-> It effectively has a filter system but NOT a search function.

-> You cannot play a song by typing the song name. Type its special (index) number instead.

-> You can only filter artist/genre by name and not by number.

-> If you think of any more, please let me know.