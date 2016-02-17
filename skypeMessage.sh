#!/bin/sh

##
## Register on "Chat Message Received > Advanced View > Execute the following script:"
## /home/Enygma/bin/skypeMessage.sh "%sname" "%smessage"
##
## Other available skype bindings are listed at http://pastebin.com/gD9KeJCX
##
## Skype 4.3, Linux version.
##

sender=$1
message=$2
notifyPattern='Edy|Edi|Eduard|Edouard|Eddie|Eddy|Enygma'

## Skype 4.3 seems to include the "sender: " prefix in the actual message. Remove the prefix.
message=${message#$sender: }

## Simple TTS
#echo "Reading: $message"
#echo "$message" | festival --tts

## Alternative using pure bash
#shopt -s nocasematch; if [[ '%smessage' =~ .*(Edy)|(Eduard)|(Eddie)|(Eddy)|(Enygma).* ]]; then notify-send "$sernder mentioned you!" -i skype; fi

## Using grep
if echo "$message" | grep -iqE $notifyPattern;
then
  notify-send "$sender mentioned you on Skype!" -i skype;
  echo "$sender mentioned you on Skype!" | festival --tts;
else
  echo "not about you: ($sender) $message";
fi