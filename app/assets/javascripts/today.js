//used in the prayer_pages/today.html.erb
$(document).ready(function () {
	$('#category_id').change( function() {
		var theURL = "/requests/byCategory/" + $('#category_id').val()
		$.ajax({url: theURL,
   		success: function(data){
				$('#displaySelection').html(data);
     	}
   	})
	});
});

//***** Today's view prayer timer functions ******
//show button after time has run out
function showResetButton(){
	document.getElementById("resetButton").style.display = "inline";
	document.getElementById("restartButton").style.display = "none";
	document.getElementById("pauseButton").style.display = "none";
}

function tickTock(){
	//show the time by setting it's display to block...so you don't see 0:00 right off the bat
	document.getElementById("time").style.display = "inline";
	//set time h1 tag in a variable called time
	var time = document.getElementById("time");
	//create minutes and call it mins
	var mins = Math.floor(remainingSeconds / 60);
	//create seconds and call it secs
	var secs = remainingSeconds - (mins * 60);
	//add 0 to seconds if it's less than 10...we don't want just 9, we want 09, 08, 07 and so on
	if(secs < 10){
		secs = "0" + secs;	
	}
	//set the timer to a string to display in the time h1 tag
	var actualTime = mins.toString() + ":" + secs;
	//display the time as a string in the time h1 tag
	time.innerHTML = actualTime;
	//once timer is zero, clear the interval and run the show button function
	if(remainingSeconds == 0){
		//stop timer
		clearInterval(interval);
		//run the showResetButton function
		showResetButton();
		//optional hide time when countdown reaches zero
		//document.getElementById("time").style.display = "none";
	}
	//make seconds count down by using --
	remainingSeconds --;
}

function restartCountdown(){
	document.getElementById("restartButton").style.display = "none";
	document.getElementById("pauseButton").style.display = "inline";

	interval = setInterval(tickTock, 1000);
}

function resetCountdown(){
	//hide the button after clicking reset counter
	document.getElementById("resetButton").style.display = "none";
	document.getElementById("restartButton").style.display = "none";
	document.getElementById("pauseButton").style.display = "inline";
	//set amount of minutes for countdown
	//****************************
	//** Number of Minutes set here **
	var minutes = 20.00;
	//****************************
	//****************************
	//make minutes out of seconds
	remainingSeconds = minutes * 60;
	//run tickTock function every one second
	interval = setInterval(tickTock, 1000);
}

function pauseCountdown() {
	document.getElementById("restartButton").style.display = "inline";
	document.getElementById("pauseButton").style.display = "none";
	// pauses countdown
	clearTimeout(interval);
}

//on load run reset to start Countdown function
window.onload = function(){
	resetCountdown();
	document.getElementById("restartButton").onclick = restartCountdown;	
	document.getElementById("resetButton").onclick = resetCountdown;
	document.getElementById("pauseButton").onclick = pauseCountdown;
}
//***** end today's view prayer timer functions ******
