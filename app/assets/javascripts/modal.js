$(function(){ //For Date Clicked
    $( "#startDate" ).datepicker();
	$( "#endDate" ).datepicker();
  });

function handleSelection(choice) 
{
	document.getElementById('bottomRow').style.display="none";
	document.getElementById('topForms').style.display="none";
	document.getElementById('toolTip').style.display="block";
	document.getElementById('author').style.display="block";
	document.getElementById('location').style.display="block";
	document.getElementById('classNumber').style.display="block";
	document.getElementById('conditionPrice').style.display="block";
	document.getElementById('timeRow').style.display="block";
	document.getElementById('dateRow').style.display="block";
	
	
	if(choice=='selectBook'||choice=='selectMeet'||choice=='selectService'||choice=='selectEvent')
	{
		document.getElementById('topForms').style.display="block";
		document.getElementById('bottomRow').style.display="block";
		document.getElementById('toolTip').style.display="none";
	}
	else
	{
		document.getElementById('topForms').style.display="none";
		document.getElementById('bottomRow').style.display="none";
		document.getElementById('toolTip').style.display="block";
	}
	
if(choice=='selectBook')
	{
		document.getElementById('location').style.display="none";
		document.getElementById('timeRow').style.display="none";
		document.getElementById('dateRow').style.display="none";
	}
	else if(choice=='selectMeet')
	{
		document.getElementById('author').style.display="none";
		document.getElementById('conditionPrice').style.display="none";
	}
	else if(choice=='selectService')
	{
		document.getElementById('author').style.display="none";
		document.getElementById('classNumber').style.display="none";
		document.getElementById('conditionPrice').style.display="none";
		document.getElementById('timeRow').style.display="none";

	}
	else //selectEvent
	{
		document.getElementById('author').style.display="none";
		document.getElementById('conditionPrice').style.display="none";
		document.getElementById('classNumber').style.display="none";
	}
}