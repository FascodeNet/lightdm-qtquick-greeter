import QtQuick 2.4

import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
 import QtQuick.Layouts 1.15
GridView {
    id: themeView
    /**/
    function erase_passwd(){

    }
    function change_clock(){
        date_text.text=new Date().toLocaleDateString(Qt.locale(),"yyyy/MM/dd  ");
        clock_text.text=new Date().toLocaleTimeString(Qt.locale(),"hh:mm  ");
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
            y: 102
            width: 307
            height: 233
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
                x: 81
                y: 206
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
                x: 20
                y: 20
                width: 70
                height: 70
                source: UserIconSrc
                fillMode: Image.PreserveAspectFit
            }

            ComboBox {
                id: sessionComboBox
                model:sessionModel
                x: 104
                y: 85
                width: 196
                height: 29
                onCurrentValueChanged: session_selected(currentValue);

                Image {
                    id: image1
                    x: 163
                    y: -1
                    width: 28
                    height: 28
                    source: "qrc:/qtquickplugin/images/template_image.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: text2
                    x: 0
                    y: -31
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
                x: 104
                y: 23
                width: 196
                height: 29
                model:UserModels
                onCurrentValueChanged: username_selected(currentValue)

                Image {
                    id: image
                    x: 163
                    y: 1
                    width: 28
                    height: 28
                    source: "qrc:/qtquickplugin/images/template_image.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: text1
                    x: 0
                    y: -27
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
                x: 20
                y: 115
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
                x: 20
                y: 166
                width: 280
                height: 34
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
            Material.primary: Material.Grey

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
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                font.pointSize: 13
                Layout.fillWidth: true
            }
            Text {
                id: hostnametext
                width: 120
                height: top_panel.height
                text: HostName
                font.pixelSize: 16
                minimumPixelSize: 24
            }

            Text {
                id: date_text
                width: 100
                height: top_panel.height
                text: qsTr("0000/00/00  ")
                font.pixelSize: 16
                minimumPixelSize: 24
            }


}


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











}












/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.25;height:480;width:640}
}
##^##*/
