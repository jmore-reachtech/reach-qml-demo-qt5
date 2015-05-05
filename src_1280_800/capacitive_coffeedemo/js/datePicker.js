var monthArrayLong = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
var dayArrayMed = new Array('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');

var defaultDateSeparator = "/";        // common values would be "/" or "."
var defaultDateFormat = "mdy"    // valid values are "mdy", "dmy", and "ymd"
var dateSeparator = defaultDateSeparator;
var dateFormat = defaultDateFormat;
var month = 0;
var year = 0;
var day = 0;

function refreshDatePicker(inc)
{

    // if no arguments are passed, use today's date; otherwise, month and year
    // are required (if a day is passed, it will be highlighted later)
    var thisDay = new Date();

    if ((month > 0) && (year > 0)) {
        month = month + inc;

        if (month > 12)
        {
            month = 1;
            year += 1;
        }
        else if (month < 1)
        {
            month = 12;
            year -= 1;
        }
        thisDay = new Date(year, month-1, 1);
      } else {
        day = thisDay.getDate();
        month = thisDay.getMonth()+1;
        year = thisDay.getFullYear();
        thisDay.setDate(1);
      }


    //Set the month and year title
    monthLabel.text = monthArrayLong[month-1] + " " + year.toString();
    // first, the leading blanks
    var i = 0;
    for (i = 0; i < thisDay.getDay(); i++)
    {
        var leadKey = eval("day" + i.toString());
        leadKey.text = "";
        leadKey.op = "";
    }

    do {
        var dayNum = thisDay.getDate();
        var key = eval("day" + i.toString());

        key.text = dayNum;
        key.op = getDateString(thisDay);

        if (dayNum == day && month == (new Date().getMonth()+1) && year == (new Date().getFullYear()))
            key.textColor = key.parent.parent.parent.highLightColor;

        // increment the day
        thisDay.setDate(thisDay.getDate() + 1);
        i++;
    } while (thisDay.getDate() > 1)


    // fill in any trailing blanks
    if (thisDay.getDay() > 0) {
       for (var j = 36; j >= i; j--)
         {
           var trailkey = eval("day" + j.toString());
           trailkey.text = "";
           trailkey.op = "";
         }
    }

    if (i <= 35)
        lastRow.visible = false;
    else
        lastRow.visible = true;
}


/**
Convert a JavaScript Date object to a string, based on the dateFormat and dateSeparator
variables at the beginning of this script library.
*/
function getDateString(dateVal)
{
  var dayString = "00" + dateVal.getDate();
  var monthString = "00" + (dateVal.getMonth()+1);
  dayString = dayString.substring(dayString.length - 2);
  monthString = monthString.substring(monthString.length - 2);

  switch (dateFormat) {
    case "dmy" :
      return dayString + dateSeparator + monthString + dateSeparator + dateVal.getFullYear();
    case "ymd" :
      return dateVal.getFullYear() + dateSeparator + monthString + dateSeparator + dayString;
    case "mdy" :
    default :
      return monthString + dateSeparator + dayString + dateSeparator + dateVal.getFullYear();
  }
}

/**
Convert a string to a JavaScript Date object.
*/
function getFieldDate(dateString)
{
  var dateVal;
  var dArray;
  var d, m, y;

  try {
    dArray = splitDateString(dateString);
    if (dArray) {
      switch (dateFormat) {
        case "dmy" :
          d = parseInt(dArray[0], 10);
          m = parseInt(dArray[1], 10) - 1;
          y = parseInt(dArray[2], 10);
          break;
        case "ymd" :
          d = parseInt(dArray[2], 10);
          m = parseInt(dArray[1], 10) - 1;
          y = parseInt(dArray[0], 10);
          break;
        case "mdy" :
        default :
          d = parseInt(dArray[1], 10);
          m = parseInt(dArray[0], 10) - 1;
          y = parseInt(dArray[2], 10);
          break;
      }
      dateVal = new Date(y, m, d);
    } else if (dateString) {
      dateVal = new Date(dateString);
    } else {
      dateVal = new Date();
    }
  } catch(e) {
    dateVal = new Date();
  }

  return dateVal;
}


/**
Try to split a date string into an array of elements, using common date separators.
If the date is split, an array is returned; otherwise, we just return false.
*/
function splitDateString(dateString)
{
  var dArray;
  if (dateString.indexOf("/") >= 0)
    dArray = dateString.split("/");
  else if (dateString.indexOf(".") >= 0)
    dArray = dateString.split(".");
  else if (dateString.indexOf("-") >= 0)
    dArray = dateString.split("-");
  else if (dateString.indexOf("\\") >= 0)
    dArray = dateString.split("\\");
  else
    dArray = false;

  return dArray;
}


