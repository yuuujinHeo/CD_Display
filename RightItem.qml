import QtQuick 2.0
//import QtQuick.Controls 2.3

Item {
    property string __pin_text: ""
    property string __menu_text: ""
    property int __outlet_status: 0
    property int mImageToggle: 0

    id: rightItemOrder
    width: 299
    height: 178

    Text {
        x: 0
        y: 40
        width: 299
        height: 55
        color: "#000000"
        text: __pin_text
        verticalAlignment: Text.AlignVCenter
        font.family: "12LotteMartDreamBold"
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 40
    }

    Text {
        x: 0
        y: 85
        width: 299
        height: 69
        color: "#000000"
        text: __menu_text
        verticalAlignment: Text.AlignVCenter
        font.family: "12LotteMartDreamMedium"
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 30
    }


    Image {
        id: imageOutlet
        anchors.fill: parent
        source: "image/outlet.png"
        fillMode: Image.Stretch
    }

    Timer{
        id: imageTimer
        interval: 1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered:{
            if(__outlet_status == 0){
                imageOutlet.visible = false
            }else{
                if(mImageToggle == 0){
                    mImageToggle = 1;
                }else{
                    mImageToggle = 0;
                }

                if(mImageToggle == 1){
                    imageOutlet.visible = true;
                }else{
                    imageOutlet.visible = false;
                }
            }
        }
    }



}
