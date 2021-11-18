﻿import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0
import io.qt.Backend 1.0
import io.qt.AdminConnector 1.0


Window {
    visible: true
    width: 1920
    height: 1080
    visibility: "FullScreen"

    Backend {
        id: backend
    }
    AdminConnector{
        id: admin
    }


    FontLoader {
        id: fontBold
        source: "font/lotteDreamBold.ttf"
    }

    FontLoader {
        id: fontLight
        source: "font/lotteDreamLight.ttf"
    }



    Image{
        id: imageBackgroundRight
        anchors.fill: parent
        source: "image/background.png"
        transformOrigin: Item.Center


        RightItem{
            id: item_1_1
            x: 1200
            y: 421
            width: 299
            height: 178
        }
        RightItem{
            id: item_1_2
            x: 1200
            y: 606
            width: 299
            height: 178
        }
        RightItem{
            id: item_1_3
            x: 1200
            y: 790
            width: 299
            height: 178
        }

        RightItem {
            id: item_2_1
            x: 1526
            y: 421
            width: 299
            height: 178
        }

        RightItem {
            id: item_2_2
            x: 1526
            y: 606
            width: 299
            height: 178
        }
        
        RightItem {
            id: item_2_3
            x: 1526
            y: 790
            width: 299
            height: 178
        }

        Text {
            id: text_call
            x: 417
            y: 55
            width: 858
            height: 72
            text: qsTr("레인보우로보틱스 010-1234-5678")
            font.pixelSize: 40
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "12LotteMartDreamBold"
        }

        Text {
            id: text_time
            y: 974
            height: 72
            text: qsTr("100")
            anchors.left: parent.left
            anchors.right: parent.right
            font.pixelSize: 40
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 1095
            anchors.leftMargin: 760
            font.family: "12LotteMartDreamBold"
        }
    }



    //LEFTTTTTTTTTTTTTTTTTTT
    // Waiting Order & Processing Order =================================================
    function waitingReload(){
        gridViewOrder1.model.clear()
        var num = admin.getLeftSize();
        //        console.log("leftview");
        //        console.log(admin.getRightPin(0,0));
        //        console.log(admin.getRightMenu(0,0));
        //        console.log(admin.getRightStatus(0,0));
        //        console.log("done");

        //        console.log(num)
        if(num >= 7){
            num = 7;
        }
        for(var i = 0; i < num; i++){//리스트의 개수만큼 for문을 돌린다.
            gridViewOrder1.model.append({"pin_text": admin.getLeftPin(i), "menu_text": admin.getLeftMenu(i), "is_making": admin.getLeftIsMaking(i)})
        }
    }

    function maintenance(){
        background_maintenance.visible = true;
        background_prepare.visible = false;
        background_error.visible = true;
    }

    function preoperation(){
        background_prepare.visible = true;
        background_maintenance.visible = false;
        background_error.visible = true;
    }
    function error(){
        background_maintenance.visible = true;
        background_prepare.visible = false;
        background_error.visible = true;
    }

    function restart(){
        background_prepare.visible = false;
        background_error.visible = false;
        background_maintenance.visible = false;
    }


    Component {//리스트 뷰의 틀을 만든다.
        id: contactDelegateOrder
        Item {
            width: 1053//823
            height: 548/7//93

            LeftItem{
                id: gridView_OrderItem
                __pin_text: pin_text
                __menu_text: menu_text
                __is_making: is_making
            }
        }
    }


    ListView {
        id: gridViewOrder1
        x: 74
        y: 416
        width: 1053
        height: 548
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.HorizontalFlick
        model: ListModel {
        }
        delegate: contactDelegateOrder
    }



    // Completed Order =================================================
    function completedReload(){
        item_1_1.__pin_text = admin.getRightPin(0,0);
        item_1_1.__menu_text = admin.getRightMenu(0,0);
        item_1_1.__outlet_status = admin.getRightStatus(0,0);


        item_1_2.__pin_text = admin.getRightPin(0,1);
        item_1_2.__menu_text = admin.getRightMenu(0,1);
        item_1_2.__outlet_status = admin.getRightStatus(0,1);

        item_1_3.__pin_text = admin.getRightPin(0,2);
        item_1_3.__menu_text = admin.getRightMenu(0,2);
        item_1_3.__outlet_status = admin.getRightStatus(0,2);


        item_2_1.__pin_text = admin.getRightPin(1,0);
        item_2_1.__menu_text = admin.getRightMenu(1,0);
        item_2_1.__outlet_status = admin.getRightStatus(1,0);

        item_2_2.__pin_text = admin.getRightPin(1,1);
        item_2_2.__menu_text = admin.getRightMenu(1,1);
        item_2_2.__outlet_status = admin.getRightStatus(1,1);

        item_2_3.__pin_text = admin.getRightPin(1,2);
        item_2_3.__menu_text = admin.getRightMenu(1,2);
        item_2_3.__outlet_status = admin.getRightStatus(1,2);

    }


    Image {
        id: background_prepare
        visible: false
        anchors.fill: parent
        source: "image/background_prepare.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: background_error
        visible: false
        anchors.fill: parent
        source: "image/background_error.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: background_maintenance
        width: 1920
        visible: false
        anchors.fill: parent
        source: "image/background_maintenance.png"
        fillMode: Image.PreserveAspectFit
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}D{i:13}D{i:5}D{i:19}D{i:20}D{i:21}
}
##^##*/
