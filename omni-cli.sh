#!/bin/sh

##
## Goal
##
# The point here is to provide a command-line interface to managing systems for the omni oakland collective.
# To start, the goal is to add users to email lists and generate user accounts on various web systems.
# This script is intended to be run locally and should only require access to the server(s) in question.

##
## Pseudocode
##
# 1. Ask for:
#    + username
#    + password (default random-generated e.g. xkcd style)
#    + email
# 2. Create accounts
#    + WordPress
#        - use wp-cli or similar https://github.com/wp-cli/wp-cli
#        - probably wp-cli-ssh is perfect for one-liner https://github.com/x-team/wp-cli-ssh
wodpressuser="ssh sudoroom.org -e 'cd /var/www/sudoroom.org/public_html/ && wp $username $email --user_pass=$password'"
#    + MediaWiki
#        - Modify maintenance/createAndPromote.php script as recommended here https://stackoverflow.com/questions/928594/script-to-add-user-to-mediawiki
#        - See createUserWithEmail.php in this directory, extends to include and validate email address.
mediawikiuser="ssh sudoroom.org -e 'cd /var/www/sudoroom.org/public_html/mediawiki/maintenance && php createUserWithEmail.php $username $password $email'"
