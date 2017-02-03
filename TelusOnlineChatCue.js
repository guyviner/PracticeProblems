// If you've ever had to get online chat support from Telus, you know there are absolutely no audio alerts for when it's your turn, and of course there is always a long cue, so I wrote this script to alert you for when you are next in line, so you stop missing your turn like I always do becuase their chat is so crappy. 

setInterval(function(){ if (document.getElementsByTagName('strong')[0].textContent == "1") {alert("IT'S FINALLY YOUR TURN!")};
 }, 5000);
