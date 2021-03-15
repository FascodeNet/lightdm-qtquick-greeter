import QtQuick 2.4

import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
GridView {
    id: themeView
    width:800
    height:450
    function erase_passwd(){

    }
    /*onLayerChanged: {
        passwordField.focus();
    }*/


    BorderImage {
        id: borderImage
        x: 0
        y: 0
        width: 800
        height: 450
        source: "qrc:/qtquickplugin/images/template_image.png"
    }

    Image {
        id: kage1
        x: 238
        y: 123
        width: 324
        height: 204
        source: "qrc:/qtquickplugin/images/template_image.png"
        fillMode: Image.PreserveAspectFit

        Rectangle {
            id: rectangle
            x: 2
            y: 2
            width: 320
            height: 200
            color: "#ffffff"
            radius: 15

            Text {
                id: text6
                x: 75
                y: 174
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
                y: 58
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
                    y: 0
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
                y: 32
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
                    y: 0
                    width: 150
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
                y: 96
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
                y: 142
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
    }

    Image {
        id: kage
        x: 0
        y: 0
        width: 800
        height: 34
        source: "qrc:/qtquickplugin/images/template_image.png"
        fillMode: Image.PreserveAspectFit

        Pane {
            id: pane
            x: 0
            y: 0
            width: 800
            height: 28

            Image {
                id: image2
                x: -12
                y: -12
                width: 800
                height: 28
                source: "qrc:/qtquickplugin/images/template_image.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text3
                x: 649
                y: -12
                width: 90
                height: 28
                text: qsTr("0000/00/00")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                minimumPixelSize: 24
            }

            Text {
                id: text4
                x: 738
                y: -12
                width: 50
                height: 28
                text: qsTr("00:00")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                minimumPixelSize: 24
            }

            Text {
                id: text5
                x: 500
                y: -12
                width: 150
                height: 28
                text: qsTr("hostname")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
                minimumPixelSize: 24
            }

            Flow {
                id: powerflow
                x: -12
                y: -12
                width: 130
                height: 28
                Button{

                    width:powerflow.width / 16 * 4
                    height: 28
                    font.pixelSize: 20
                    icon.color: "transparent"
                    icon.source:"icons/power_settings_new-24px.svg"
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
                    height: 28
                    font.pixelSize: 20
                    icon.color: "transparent"
                    icon.source:"icons/restart_alt-24px.svg"
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
                    height: 28
                    font.pixelSize: 20
                    icon.color: "transparent"
                    icon.source:"icons/mode_night-24px.svg"
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
                    height: 28
                    font.pixelSize: 20
                    icon.color: "transparent"
                    icon.source:"icons/airline_seat_flat-24px.svg"
                    hoverEnabled: true
                    ToolTip.timeout: 5000
                    ToolTip.visible: hovered
                    ToolTip.text: qsTr("Hibernate")
                    onClicked: {
                        hibernate();
                    }
                }
            }


        }
    }

    Image {
        id: usericonimage1
        x: 8
        y: 382
        width: 180
        height: 60
        source: UserIconSrc
        fillMode: Image.PreserveAspectFit
    }











}










/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}
}
##^##*/
