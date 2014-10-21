
var degreeAngle = 360.0/repeater.model.count; //disect the circle into slices
var digitAngle = degreeAngle/57.2957795;  //1 radian = 57.2957795 degrees
var angleOffSet =  90.0 + degreeAngle/2; //We rotate the needle around the positive x axis in a downward position
var value = 0.0;
var index = 0.0;
