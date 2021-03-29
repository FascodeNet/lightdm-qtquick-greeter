import QtQuick 2.4

import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
 import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
GridView {
    id: themeView
    /**/
    function erase_passwd(){

    }
    function change_clock(){
        date_text.text=new Date().toLocaleDateString(Qt.locale(),"yyyy/MM/dd  ");
        clock_text.text=new Date().toLocaleTimeString(Qt.locale(),"hh:mm  ");
    }

    Image {
        id: sereneLogo
        x: 8
        y: 382
        width: 180
        height: 60
        source: "qrc:/icons/serene.svg"
        asynchronous: false
        mirror: false
        mipmap: false
        cache: false
        smooth: false
        fillMode: Image.PreserveAspectFit
    }

    MaskedBlur {
        anchors.fill: sereneLogo
        source: sereneLogo
        radius: 8
        samples: 16
        maskSource: mask
    }


    Item {
        anchors.fill: sereneLogo
        opacity: 0.75
        Item {
            id: mask
            anchors.fill: parent
            z: 1

            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: sereneLogo.headerItem.height
            }

            Rectangle {
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                height: sereneLogo.footerItem.height
            }
        }
    }
    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: change_clock();
    }

    BorderImage {
        id: borderImage
        x: 0
        y: 0
        width: top_panel.width
        height: 450
        source: "qrc:/qtquickplugin/images/template_image.png"
    }

    Rectangle {
        id: rectangle
        x: 258
        y: 42
        width: 335
        height: 293
        color: "#ffffff"
        radius: 15
            Component.onCompleted:{
                    var maxX=Screen_width - rectangle.width;
                    var maxY=Screen_height - rectangle.height;
                    function getOffset(offsetpct,maxVal,defaultVal){
                        var offset = defaultVal > maxVal ? maxVal : defaultVal;
                        if(offsetpct > 100) offsetpct=100;
                        offset=(maxVal * offsetpct)/100;
                        return offset;
                    }
                    var defaultX=10*maxX/100;
                    var defaultY=50*maxY/100;
                    var offsetX=getOffset(50,maxX,defaultX);
                    var offsetY=getOffset(50,maxY,defaultY);
                    rectangle.x=offsetX;
                    rectangle.y=offsetY;

                }
            BusyIndicator{
                id:busyindi
                objectName: "BusyIndic"
                width:rectangle.width * 1.5
                height: rectangle.width * 1.5
                x:rectangle.width / 2 - width /2
                y:rectangle.height / 2 - height / 2
                running:false
            }

            Text {
                id: text6
                x: 88
                y: 267
                width: 170
                height: 18
                color: "#8b0000"
                text: qsTr("errorテキスト")
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                font.bold: false
                styleColor: "#8b0000"
            }


            Image {
                id: usericonimage
                x: 25
                y: 50
                width: 70
                height: 70
                source: UserIconSrc
                fillMode: Image.PreserveAspectFit
            }

            ComboBox {
                id: sessionComboBox
                model:sessionModel
                x: 111
                y: 110
                width: 196
                height: 38
                onCurrentValueChanged: session_selected(currentValue);

                Text {
                    id: text2
                    x: 0
                    y: -25
                    width: 150
                    height: 29
                    text: qsTr("Session")
                    font.pixelSize: 17
                    minimumPixelSize: 18
                    styleColor: "#ffffff"
                    style: Text.Outline
                }

            }

            ComboBox {
                id: usercomboBox
                x: 112
                y: 43
                width: 196
                height: 38
                model:UserModels
                onCurrentValueChanged: username_selected(currentValue)

                Text {
                    id: text1
                    x: 0
                    y: -24
                    width: 90
                    height: 29
                    text: qsTr("UserName")
                    font.pixelSize: 17
                    minimumPixelSize: 18
                    style: Text.Outline
                    styleColor: "#ffffff"
                }

            }

            TextField {
                id: passwordField
                objectName: "passwordField_obj"
                x: 28
                y: 172
                width: 280
                height: 45
                opacity: 1
                text: ""
                scale: 1
                activeFocusOnTab: true
                focus: true
                antialiasing: false
                smooth: true
                baselineOffset: 0
                layer.textureSize.height: 0
                layer.textureSize.width: 0
                hoverEnabled: true
                placeholderText: qsTr("Password")
                echoMode: TextInput.Password
                onAccepted: loginbutton_clicked(text);
                enabled: true

            }

            Button {
                id: loginbutton
                x: 28
                y: 224
                width: 280
                height: 38
                text: qsTr("ログイン")
                font.italic: false
                font.bold: false
                hoverEnabled: false
                enabled: true
                font.pointSize: 14
                onClicked: {
                    busyindi.running=true
                    loginbutton_clicked(passwordField.text);
                }


            }


        }

        ToolBar {
            id: top_panel
            x: 0
            y: 0
            width: Screen_width
            height: 36

            Material.primary: "#6E6E6E"
            RowLayout {

                anchors.fill: parent
            Flow {
                id: powerflow
                height: 36
                width: 32 / 3 * 16
                Image{
                    width:powerflow.width / 16 * 1
                    height: powerflow.height / 16 *3
                }

                Image{

                    width:powerflow.width / 16 * 3
                    height: powerflow.width / 16 * 3
                    source:"qrc:/icons/system-shutdown.png"

                    ToolTip.timeout: 5000
                    property string toolTipText: qsTr("Power Off")
                    ToolTip.text: toolTipText
                    ToolTip.visible: toolTipText ? pwrarea.containsMouse : false
                    MouseArea{
                        id:pwrarea
                        hoverEnabled: true
                        anchors.fill: parent
                        onClicked: {
                            shutdown();
                        }
                    }
                }
                Image{
                    width:powerflow.width / 16 * 1
                    height: powerflow.height / 16 *3
                }

                Image {

                    width:powerflow.width / 16 * 3
                    height: powerflow.width / 16 * 3
                    source:"qrc:/icons/system-restart.png"
                    ToolTip.timeout: 5000
                    property string toolTipText: qsTr("Restart")
                    ToolTip.text: toolTipText
                    ToolTip.visible: toolTipText ? restartarea.containsMouse : false
                    MouseArea{
                        id:restartarea
                         anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            reboot();
                        }
                    }
                }
                Image{
                    width:powerflow.width / 16 * 1
                    height: powerflow.height / 16 *3
                }
                Image{
                    width:powerflow.width / 16 * 3
                    height: powerflow.width / 16 * 3
                    source:"qrc:/icons/system-suspend.png"
                    ToolTip.timeout: 5000
                    property string toolTipText: qsTr("Sleep")
                    ToolTip.text: toolTipText
                    ToolTip.visible: toolTipText ? sleeparea.containsMouse : false
                    MouseArea{
                        id:sleeparea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                           suspend();
                        }
                    }
                }
                Image{
                    width:powerflow.width / 16 * 1
                    height: powerflow.height / 16 *3
                }
                Image{
                    width:powerflow.width / 16 * 3
                    height: powerflow.width / 16 * 3
                    source:"qrc:/icons/system-suspend-hibernate.png"
                    ToolTip.timeout: 5000
                    property string toolTipText: qsTr("Hibernate")
                    ToolTip.text: toolTipText
                    ToolTip.visible: toolTipText ? hiberarea.containsMouse : false
                    MouseArea{
                        id:hiberarea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            hibernate();
                        }
                    }
                }
            }


            Label {
                id:clock_text
                text: "00:00  "
                color: "#ffffff"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                font.pointSize: 13
                Layout.fillWidth: true
            }
            Text {
                id: hostnametext
                color: "#ffffff"
                width: 120
                height: top_panel.height
                text: HostName
                font.pixelSize: 16
                minimumPixelSize: 24
            }

            Text {
                id: date_text
                width: 100
                color: "#ffffff"
                height: top_panel.height
                text: qsTr("0000/00/00  ")
                font.pixelSize: 16
                minimumPixelSize: 24
            }


}


    }












}












/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
