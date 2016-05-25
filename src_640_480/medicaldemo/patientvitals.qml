import QtQuick 2.0
import "../components"

Item {
    id: root
    width: 640
    height: 480
    property string txtMinute: mainview.minute < 10 ? "0" + mainview.minute : mainview.minute
    property string txtHour: mainview.hour < 10 ? "0" + mainview.hour : mainview.hour
    signal message(string msg)
    property var col
    property var col1
    property int i: 0
    property int j: 0

    Text {
        id: txtTime
        anchors.top: parent.top
        anchors.topMargin: 16
        x: 474
        color: "#ffffff"
        text: "01-05-2016  " + txtHour + ":"
        font.pixelSize: 19
        font.family: "Museo Sans Rounded 300"
    }

    Text {
        id: txtMin
        x: 610
        anchors.top: parent.top
        anchors.topMargin: 16
        color: "#ffffff"
        text: txtMinute
        font.pixelSize: 19
        font.family: "Museo Sans Rounded 300"
    }


    ImageButton {
        id: imgNameBox
        width: 620
        height: 30
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -155
        text: mainview.patientName
        imageUp: "images/name_box.png"
        imageDown: "images/name_box_down.png"
        font.pixelSize: 22
        textColor: "#ffffff"
        font.family: "Museo Sans Rounded 300"

        onButtonRelease: {
            tempTimer.stop();
            pressureTimer.stop();
            ekgGraphTimer.stop();
            oxygenGraphTimer.stop();
            load.source = "patientlist.qml";
        }
    }


    Image {
        id: imgTemp
        anchors.top: imgNameBox.bottom
        anchors.topMargin: 7
        anchors.left: parent.left
        anchors.leftMargin: 10
        width: 304
        height: 116
        source: "images/temp_box.png"

        Text {
            id: txtTemp
            x: 130
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("98.5")
            anchors.verticalCenterOffset: 1
            font.bold: true
            font.pixelSize: 44
            anchors.verticalCenter: parent.verticalCenter

            Timer{
                id: tempTimer
                interval: 1100;
                running: true;
                repeat: true
                onTriggered: {
                    var temp = getRandomInt(98, 100);
                    txtTemp.text = temp + "." + getRandomInt(0, 9);
                    if (temp > 99)
                    {
                        txtFarenheight.x = 248;
                        imgTempBad.visible = true;
                    }
                    else
                    {
                        txtFarenheight.x = 232;
                        imgTempBad.visible = false;
                    }
                }
            }
        }

        Image{
            id: txtFarenheight
            x: 232
            y: 43
            source: "images/farenheit.png"
        }

        Image {
            id: imgTempBad
            x: 15
            y: 21
            visible: false
            source: "images/temperature_bad.png"
        }

    }


    Image {
        id: imgPressure
        anchors.top: imgNameBox.bottom
        anchors.topMargin: 7
        anchors.left: imgTemp.right
        anchors.leftMargin: 12
        width: 304
        height: 116
        source: "images/blood_pressure_box.png"

        Text {
            id: txtSystollic
            x: 128
            width: 81
            height: 49
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("124")
            anchors.verticalCenterOffset: 0
            font.bold: true
            font.pixelSize: 42
            anchors.verticalCenter: parent.verticalCenter

        }

        Text {
            id: txtSeperator
            x: 204
            y: 33
            width: 21
            height: 49
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("/")
            font.pixelSize: 42
        }

        Text {
            id: txtDiaStollic
            x: 227
            height: 49
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("83")
            anchors.verticalCenterOffset: 0
            font.bold: true
            font.pixelSize: 42
            anchors.verticalCenter: parent.verticalCenter

        }

        Text {
            id: txtMMHG
            x: 130
            y: 74
            color: "#ffffff"
            font.family: "Museo Sans Rounded 300"
            text: qsTr("(96) mmHG")
            anchors.leftMargin: 2
            font.pixelSize: 19
        }

        Timer{
            id: pressureTimer
            interval: 1000;
            running: true;
            repeat: true
            onTriggered: {
                txtSystollic.text = getRandomInt(100, 122);
                if (parseInt(txtSystollic.text) > 120)
                    imgPressureBad.visible = true;
                else
                    imgPressureBad.visible = false;
                txtDiaStollic.text = getRandomInt(70, 100);
                txtMMHG.text = "(" + parseInt(parseInt(txtDiaStollic.text) + 0.33*(parseFloat(txtSystollic.text) - parseFloat(txtDiaStollic.text))) + ") mmHG";
            }
        }

        Image {
            id: imgPressureBad
            x: 22
            y: 22
            width: 77
            height: 78
            sourceSize.height: 78
            sourceSize.width: 77
            visible: true
            source: "images/heartbeat_bad.png"
        }
    }


    Image {
        id: imgHeartRate
        x: 10
        anchors.top: imgO2Rate.bottom
        anchors.topMargin: 7
        anchors.left: parent.left
        anchors.leftMargin: 11
        width: 620
        height: 116
        source: "images/heart_rate_box_large.png"

        Text {
            id: txtHeartRate
            x: 130
            width: 49
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("100")
            font.bold: true
            font.pixelSize: 44
            anchors.verticalCenter: parent.verticalCenter

            Timer{
                id: heartTimer
                interval: 1200;
                running: true;
                repeat: true
                onTriggered: {
                    txtHeartRate.text = getRandomInt(60, 100);
                    if (parseInt(txtHeartRate.text) > 99)
                    {
                        imgHeartRateBad.visible = true;
                        txtBPM.x = 213;
                    }
                    else
                    {
                        imgHeartRateBad.visible = false;
                        txtBPM.x = 187;
                    }
                }
            }
        }

        Text{
            id: txtBPM
            x: 213
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("bpm")
            font.bold: true
            font.pixelSize: 42
            anchors.verticalCenter: parent.verticalCenter
        }

        Image{
            id: imgHeartRateBad
            x: 16
            y: 21
            visible: false
            source: "images/heartbeat_bad.png"
        }

        MedicalScopeChart {
            id: scopeChart2
            x: 296
            y: 2
            width: 328
            height: 129
            scaleLineColor: "rgba(0,0,0,0)"
            scaleShowGridLines: true
            scaleFontSize: 12
            scaleGridLineColor: "rgba(0,0,0,0)"
            bgColor: "transparent"
            bezierCurve: false
            minYValue: 820
            datasetStrokeWidth: 3
            scaleLineWidth: 1
            scaleShowLabels: false
            scaleGridLineWidth: 1
            scaleLabel: "<%=value%>"
            scaleFontStyle: "normal"
            minTime: -1
            scaleFontColor: "#666"
            line1PenColor: "#00b8ff"
            scaleFontFamily: "DejaVu Sans"
            maxYValue: 860
            xPixels: 20
            scaleBgColor: "#414042"
            maxTime: xAxisLength/2

            onCompletedChanged: {
                if (completed)
                {
                    startEKGChart();
                }
            }
        }

    }


    Image {
        id: imgO2Rate
        anchors.top: imgTemp.bottom
        anchors.topMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 10
        width: 620
        height: 116
        source: "images/o2_rate_box_large.png"

        Text {
            id: txt02Rate
            x: 130
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("98")
            anchors.verticalCenterOffset: 1
            font.bold: true
            font.pixelSize: 44
            anchors.verticalCenter: parent.verticalCenter

            Timer{
                id: oTimer
                interval: 1400;
                running: true;
                repeat: true
                onTriggered: {
                    txt02Rate.text = getRandomInt(88, 99);
                    if (parseInt(txt02Rate.text) < 90)
                        imgO2RateBad.visible = true;
                    else
                        imgO2RateBad.visible = false;
                }
            }
        }

        Text{
            id: txtPercentage
            x: 189
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("%")
            anchors.verticalCenterOffset: 1
            font.bold: true
            font.pixelSize: 42
            anchors.verticalCenter: parent.verticalCenter
        }

        Image {
            id: imgO2RateBad
            x: 15
            y: 21
            visible: false
            source: "images/oxygen_bad.png"
        }

        MedicalScopeChart {
            id: scopeChart1
            x: 296
            y: 2
            width: 328
            height: 129
            scaleLineColor: "rgba(0,0,0,0)"
            scaleShowGridLines: true
            scaleFontSize: 12
            scaleGridLineColor: "rgba(0,0,0,0)"
            bgColor: "transparent"
            bezierCurve: false
            minYValue: 15
            datasetStrokeWidth: 3
            scaleLineWidth: 1
            scaleShowLabels: false
            scaleGridLineWidth: 1
            scaleLabel: "<%=value%>"
            scaleFontStyle: "normal"
            minTime: -1
            scaleFontColor: "#666"
            line1PenColor: "#00b8ff"
            scaleFontFamily: "DejaVu Sans"
            maxYValue: 60
            xPixels: 20
            scaleBgColor: "#414042"
            maxTime: xAxisLength/2

            onCompletedChanged: {
                if (completed)
                {
                    startOxygenChart();
                }
            }
        }

    }

    function startOxygenChart()
    {
        var lsz = 182;

        col = new Array([lsz]);
        col[0] = "25";
        col[1] = "24";
        col[2] = "23";
        col[3] = "23";
        col[4] = "22";
        col[5] = "21";
        col[6] = "20";
        col[7] = "20";
        col[8] = "19";
        col[9] = "19";
        col[10] = "19";
        col[11] = "18";
        col[12] = "18";
        col[13] = "17";
        col[14] = "18";
        col[15] = "19";
        col[16] = "23";
        col[17] = "27";
        col[18] = "33";
        col[19] = "39";
        col[20] = "44";
        col[21] = "49";
        col[22] = "52";
        col[23] = "54";
        col[24] = "56";
        col[25] = "56";
        col[26] = "56";
        col[27] = "56";
        col[28] = "55";
        col[29] = "54";
        col[30] = "52";
        col[31] = "50";
        col[32] = "48";
        col[33] = "46";
        col[34] = "44";
        col[35] = "43";
        col[36] = "42";
        col[37] = "42";
        col[38] = "41";
        col[39] = "40";
        col[40] = "40";
        col[41] = "39";
        col[42] = "38";
        col[43] = "37";
        col[44] = "35";
        col[45] = "33";
        col[46] = "32";
        col[47] = "30";
        col[48] = "29";
        col[49] = "28";
        col[50] = "27";
        col[51] = "26";
        col[52] = "25";
        col[53] = "24";
        col[54] = "23";
        col[55] = "22";
        col[56] = "22";
        col[57] = "22";
        col[58] = "22";
        col[59] = "21";
        col[60] = "21";
        col[61] = "20";
        col[62] = "19";
        col[63] = "18";
        col[64] = "18";
        col[65] = "18";
        col[66] = "19";
        col[67] = "21";
        col[68] = "25";
        col[69] = "30";
        col[70] = "35";
        col[71] = "40";
        col[72] = "46";
        col[73] = "50";
        col[74] = "54";
        col[75] = "56";
        col[76] = "56";
        col[77] = "56";
        col[78] = "56";
        col[79] = "56";
        col[80] = "55";
        col[81] = "53";
        col[82] = "52";
        col[83] = "50";
        col[84] = "49";
        col[85] = "47";
        col[86] = "46";
        col[87] = "45";
        col[88] = "44";
        col[89] = "43";
        col[90] = "42";
        col[91] = "41";
        col[92] = "40";
        col[93] = "40";
        col[94] = "39";
        col[95] = "38";
        col[96] = "36";
        col[97] = "35";
        col[98] = "33";
        col[99] = "32";
        col[100] = "31";
        col[101] = "30";
        col[102] = "29";
        col[103] = "28";
        col[104] = "27";
        col[105] = "27";
        col[106] = "26";
        col[107] = "25";
        col[108] = "25";
        col[109] = "24";
        col[110] = "24";
        col[111] = "23";
        col[112] = "22";
        col[113] = "22";
        col[114] = "22";
        col[115] = "21";
        col[116] = "21";
        col[117] = "21";
        col[118] = "21";
        col[119] = "23";
        col[120] = "26";
        col[121] = "31";
        col[122] = "36";
        col[123] = "42";
        col[124] = "48";
        col[125] = "52";
        col[126] = "55";
        col[127] = "57";
        col[128] = "57";
        col[129] = "58";
        col[130] = "57";
        col[131] = "57";
        col[132] = "56";
        col[133] = "55";
        col[134] = "53";
        col[135] = "51";
        col[136] = "49";
        col[137] = "47";
        col[138] = "45";
        col[139] = "44";
        col[140] = "44";
        col[141] = "43";
        col[142] = "43";
        col[143] = "42";
        col[144] = "41";
        col[145] = "40";
        col[146] = "39";
        col[147] = "37";
        col[148] = "36";
        col[149] = "35";
        col[150] = "33";
        col[151] = "32";
        col[152] = "30";
        col[153] = "29";
        col[154] = "27";
        col[155] = "26";
        col[156] = "25";
        col[157] = "25";
        col[158] = "24";
        col[159] = "24";
        col[160] = "23";
        col[161] = "22";
        col[162] = "22";
        col[163] = "21";
        col[164] = "21";
        col[165] = "21";
        col[166] = "21";
        col[167] = "20";
        col[168] = "20";
        col[169] = "20";
        col[170] = "20";
        col[171] = "22";
        col[172] = "25";
        col[173] = "30";
        col[174] = "36";
        col[175] = "41";
        col[176] = "47";
        col[177] = "52";
        col[178] = "55";
        col[179] = "58";
        col[180] = "60";
        col[181] = "61";

        oxygenGraphTimer.start();

    }

    Timer{
        id: oxygenGraphTimer
        interval: 10; running: false; repeat: true
        onTriggered: {
            scopeChart1.currentValue1 = col[i];
            i ++;
            if (i == 182)
                i = 0;
        }
    }

    function startEKGChart(){
        var lsz = 182;
        col1 = new Array([lsz]);
        col1[0] = "831";
        col1[1] = "830.6666667";
        col1[2] = "827.3333333";
        col1[3] = "827.3333333";
        col1[4] = "824.6666667";
        col1[5] = "825.6666667";
        col1[6] = "826.3333333";
        col1[7] = "829.6666667";
        col1[8] = "832";
        col1[9] = "832.6666667";
        col1[10] = "830.6666667";
        col1[11] = "827.3333333";
        col1[12] = "825";
        col1[13] = "827.6666667";
        col1[14] = "827.3333333";
        col1[15] = "828.3333333";
        col1[16] = "830.3333333";
        col1[17] = "830.6666667";
        col1[18] = "829.6666667";
        col1[19] = "827.6666667";
        col1[20] = "832";
        col1[21] = "834";
        col1[22] = "834.3333333";
        col1[23] = "836";
        col1[24] = "835";
        col1[25] = "832";
        col1[26] = "827.3333333";
        col1[27] = "826";
        col1[28] = "828.6666667";
        col1[29] = "829.3333333";
        col1[30] = "832.6666667";
        col1[31] = "832.6666667";
        col1[32] = "830.6666667";
        col1[33] = "826";
        col1[34] = "826";
        col1[35] = "829";
        col1[36] = "839";
        col1[37] = "848";
        col1[38] = "857.6666667";
        col1[39] = "860.3333333";
        col1[40] = "858";
        col1[41] = "853.3333333";
        col1[42] = "843.3333333";
        col1[43] = "834";
        col1[44] = "826.6666667";
        col1[45] = "827.6666667";
        col1[46] = "829.6666667";
        col1[47] = "830.3333333";
        col1[48] = "828";
        col1[49] = "827.3333333";
        col1[50] = "828.6666667";
        col1[51] = "832";
        col1[52] = "834.3333333";
        col1[53] = "835";
        col1[54] = "835";
        col1[55] = "834";
        col1[56] = "833.3333333";
        col1[57] = "831.3333333";
        col1[58] = "831.6666667";
        col1[59] = "832.6666667";
        col1[60] = "836";
        col1[61] = "837.6666667";
        col1[62] = "838";
        col1[63] = "837.6666667";
        col1[64] = "839.6666667";
        col1[65] = "839.6666667";
        col1[66] = "841.3333333";
        col1[67] = "842.3333333";
        col1[68] = "844.3333333";
        col1[69] = "847";
        col1[70] = "846";
        col1[71] = "848";
        col1[72] = "847.3333333";
        col1[73] = "850";
        col1[74] = "851";
        col1[75] = "848";
        col1[76] = "848.6666667";
        col1[77] = "848.3333333";
        col1[78] = "848.6666667";
        col1[79] = "842.6666667";
        col1[80] = "836.6666667";
        col1[81] = "833";
        col1[82] = "834.6666667";
        col1[83] = "834.3333333";
        col1[84] = "833.3333333";
        col1[85] = "832.3333333";
        col1[86] = "831.3333333";
        col1[87] = "832";
        col1[88] = "830";
        col1[89] = "830.3333333";
        col1[90] = "831.3333333";
        col1[91] = "833.3333333";
        col1[92] = "835";
        col1[93] = "834.3333333";
        col1[94] = "831";
        col1[95] = "829.3333333";
        col1[96] = "826.3333333";
        col1[97] = "829.6666667";
        col1[98] = "831";
        col1[99] = "835.6666667";
        col1[100] = "836.6666667";
        col1[101] = "833.6666667";
        col1[102] = "833";
        col1[103] = "828.6666667";
        col1[104] = "832";
        col1[105] = "834.3333333";
        col1[106] = "837.6666667";
        col1[107] = "840.3333333";
        col1[108] = "836.6666667";
        col1[109] = "834.6666667";
        col1[110] = "830";
        col1[111] = "829";
        col1[112] = "831";
        col1[113] = "832.6666667";
        col1[114] = "833.3333333";
        col1[115] = "833.3333333";
        col1[116] = "833";
        col1[117] = "832.3333333";
        col1[118] = "832";
        col1[119] = "830.6666667";
        col1[120] = "833.6666667";
        col1[121] = "833.6666667";
        col1[122] = "835.6666667";
        col1[123] = "838.3333333";
        col1[124] = "836.6666667";
        col1[125] = "834.6666667";
        col1[126] = "830";
        col1[127] = "830";
        col1[128] = "834.6666667";
        col1[129] = "838.3333333";
        col1[130] = "840.3333333";
        col1[131] = "837.6666667";
        col1[132] = "834";
        col1[133] = "833.3333333";
        col1[134] = "832.6666667";
        col1[135] = "834.3333333";
        col1[136] = "837.6666667";
        col1[137] = "840";
        col1[138] = "840.3333333";
        col1[139] = "837.6666667";
        col1[140] = "838";
        col1[141] = "837.3333333";
        col1[142] = "835.3333333";
        col1[143] = "831.6666667";
        col1[144] = "832.3333333";
        col1[145] = "836";
        col1[146] = "837.6666667";
        col1[147] = "837.6666667";
        col1[148] = "835.6666667";
        col1[149] = "835";
        col1[150] = "835.6666667";
        col1[151] = "835.3333333";
        col1[152] = "836.3333333";
        col1[153] = "837.3333333";
        col1[154] = "838.3333333";
        col1[155] = "840.6666667";
        col1[156] = "838.3333333";
        col1[157] = "838.6666667";
        col1[158] = "836.6666667";
        col1[159] = "838";
        col1[160] = "840";
        col1[161] = "841";
        col1[162] = "843";
        col1[163] = "843";
        col1[164] = "842.3333333";
        col1[165] = "838";
        col1[166] = "834.6666667";
        col1[167] = "830.6666667";
        col1[168] = "832.3333333";
        col1[169] = "834.3333333";
        col1[170] = "837.6666667";
        col1[171] = "837.6666667";
        col1[172] = "837";
        col1[173] = "833.6666667";
        col1[174] = "834.3333333";
        col1[175] = "835.6666667";
        col1[176] = "848";
        col1[177] = "859.6666667";
        col1[178] = "871";
        col1[179] = "871";
        col1[180] = "866";
        col1[181] = "857.3333333";

        ekgGraphTimer.start();
    }

    Timer{
        id: ekgGraphTimer
        interval: 10; running: false; repeat: true
        onTriggered: {
            scopeChart2.currentValue1 = col1[i];
            j ++;
            if (j == 182)
                j = 0;
        }
    }

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

}
