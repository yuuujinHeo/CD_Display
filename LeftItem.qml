import QtQuick 2.0

Item {
    property string __pin_text: "00001"
    property string __menu_text: "블랙티"
    property bool __is_making: false

    id: leftItemOrder
    width: 1053//823
    height: 548/7//93

    Text {
        x: 0
        y: 0
        width: 338
        height: 78
        color: "#000000"
        text: __pin_text
        verticalAlignment: Text.AlignVCenter
        font.family: "12LotteMartDreamBold"
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 30
    }

    Text {
        x: 342
        y: 1
        width: 382
        height: 77
        color: "#000000"
        text: __menu_text
        verticalAlignment: Text.AlignVCenter
        font.family: "12LotteMartDreamMedium"
        minimumPixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 30
    }

    Rectangle {
        x: 867
        y: 17
        width: 45
        height: 45
        radius: 20
        border.width: 3
        border.color: "#000000"
        color: __is_making ? "#ffc800" : "transparent"
    }



}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
