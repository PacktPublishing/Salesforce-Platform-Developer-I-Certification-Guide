Integer iPlace = 2;
String sMedalColor = '';

switch on iPlace {
	when 1{
		sMedalColor = 'Gold';
	}
	when 2{
		sMedalColor = 'Silver';
	}
	when 3{
		sMedalColor = 'Bronze';
	}
	when else {
 		sMedalColor = 'Unfortunately, no medal';
	}
}
