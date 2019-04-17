Integer i = 1;
String s = ‘a’;

if (i == 1 || s == ‘a’){
// this code will be executed. Both expressions are true
}

if (i == 1 || s == ‘b’){
// this code will be executed. One expression is true
}

if (i == 0 || s == ‘b’){
// this code will not be executed. None of the expressions are true
}
