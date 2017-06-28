#!/bin/bash
#
# https://www.digitalocean.com/community/tutorials/how-to-use-reprepro-for-a-secure-package-repository-on-ubuntu-14-04

MASTERKEY="$1"

# Detach Master Key From Subkey
gpg --export-secret-key $MASTERKEY > private.key
gpg --export $MASTERKEY >> private.key
gpg --delete-secret-key $MASTERKEY
gpg --import public.key signing.key
gpg --send-key $MASTERKEY
