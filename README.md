# Notes_organiser

Simple notes organiser for quickly taking notes.
Made for not having many wirdly named files in the home catalog.

# Motivation

Often I found myself in the situation where there are files named: "a", "ab", "abc", "abcd", "abcdefgh", "aa", "aaa", "aaaa", "aaaaaaaaaa" 
in my home directory.

# Usage
This is a bash script that takes current time and makes a file of that name. It puts the file in Notatki/[year]/[month] catalog for better organisation. 

It on default opens gedit to edit this file, but it can take two arguments "file_name" and "editor":

        Notatki file_name editor
        
And then it will make a file [date]_file_name 

and open it in "editor".
