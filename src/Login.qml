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
        date_text.text=new Date().toLocaleDateString(Qt.locale(),"yyyy/MM/dd");
        clock_text.text=new Date().toLocaleTimeString(Qt.locale(),"hh:mm  ");
    }

    /*onLayerChanged: {
        passwordField.focus();
    }*/

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
                y: 120
                width: 280
                height: 40
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

                color: "#00000000"

                ProgressBar {
                    id: progressBar
                    x: 0
                    y: 36
                    width: 280
                    height: 4
                    value: 0.5
                }
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
                    loginbutton_clicked(passwordField.text);
                }


                ProgressBar {
                    id: progressBar2
                    x: 0
                    y: 0
                    width: 280
                    height: 4
                    value: 0.5
                    rotation: 0
                }

                ProgressBar {
                    id: progressBar1
                    x: 261
                    y: 15
                    width: 34
                    height: 4
                    rotation: 90
                    value: 0.5
                }


                ProgressBar {
                    id: progressBar3
                    x: 0
                    y: 30
                    width: 280
                    height: 4
                    value: 0.5
                    rotation: 180
                }

                ProgressBar {
                    id: progressBar4
                    x: -15
                    y: 15
                    width: 34
                    height: 4
                    value: 0.5
                    rotation: 270
                }
            }


        }


        ToolBar {
            id: top_panel
            x: 0
            y: 0
            width: Screen_width
            height: 56

            RowLayout {
                anchors.fill: parent


            Flow {
                id: powerflow
                width: 260
                height: 56
                Button{

                    width:powerflow.width / 16 * 4
                    height: powerflow.height
                    font.pixelSize: 20
                    icon.color: "transparent"
                    icon.source:"qrc:/icons/power_settings_new-24px.svg"
                    hoverEnabled: true
                    ToolTip.timeout: 5000
                    ToolTip.visible: hovered
                    ToolTip.text: qsTr("Power Off")
                    onClicked: {
                        shutdown();
                    }

                }
                Button{
                    x: 35
                    width:powerflow.width / 16 * 4
                    height: powerflow.height
                    font.pixelSize: 20
                    icon.color: "transparent"
                    icon.source:"qrc:/icons/restart_alt-24px.svg"
                    hoverEnabled: true
                    ToolTip.timeout: 5000
                    ToolTip.visible: hovered
                    ToolTip.text: qsTr("Restart")
                    onClicked: {
                        reboot();
                    }
                }
                Button{
                    width:powerflow.width / 16 * 4
                    height: powerflow.height
                    font.pixelSize: 20
                    icon.color: "transparent"
                    icon.source:"qrc:/icons/mode_night-24px.svg"
                    hoverEnabled: true
                    ToolTip.timeout: 5000
                    ToolTip.visible: hovered
                    ToolTip.text: qsTr("Sleep")
                    onClicked: {
                        suspend();
                    }
                }
                Button{
                    width:powerflow.width / 16 * 4
                    height: powerflow.height
                    font.pixelSize: 20
                    icon.color: "transparent"
                    icon.source:"qrc:/icons/airline_seat_flat-24px.svg"
                    hoverEnabled: true
                    ToolTip.timeout: 5000
                    ToolTip.visible: hovered
                    ToolTip.text: qsTr("Hibernate")
                    onClicked: {
                        hibernate();
                    }
                }
            }


            Image {
                id: image2
                Layout.fillWidth: true
                height: top_panel.height
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                source: "qrc:/qtquickplugin/images/template_image.png"
                fillMode: Image.PreserveAspectFit
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
                text: qsTr("0000/00/00   ")
                font.pixelSize: 16
                minimumPixelSize: 24
            }

            Text {
                id: clock_text
                width: 50
                height: top_panel.height
                text: qsTr("00:00  ")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
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
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
