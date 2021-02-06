import QtQuick 2.4

import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
GridView {
    id: themeView
    width:800
    height:450
    Image {
        id: usericonimage
        x: 335
        y: 97
        width: 130
        height: 130
        source: UserIconSrc
        fillMode: Image.PreserveAspectFit
    }
   ComboBox {
       id: usercomboBox
       x: 201
       y: 233
       width:themeView.width * 0.5
       model:UserModels
       onCurrentValueChanged: username_selected(currentValue)
   }

   Text {
       id: text1
       x: 379
       y: 61
       text: qsTr("User")
       font.pixelSize: 20
   }
    function erase_passwd(){

    }
    /*onLayerChanged: {
        passwordField.focus();
    }*/
   TextField {
       id: passwordField
       objectName: "passwordField_obj"
       x: 201
       y: 292
       width:themeView.width * 0.5
       text: ""
       hoverEnabled: true
       placeholderText: qsTr("Password")
       echoMode: TextInput.Password
       onAccepted: loginbutton_clicked(text);
       enabled: true
   }

   ComboBox {
       id: sessionComboBox
       model:sessionModel
       x: 13
       y: 402
       width:themeView.width * 0.3
       onCurrentValueChanged: session_selected(currentValue);

   }

   Text {
       id: text2
       x: 97
       y: 366
       text: qsTr("Session")
       font.pixelSize: 20
   }

   Button {
       id: loginbutton
       x: 692
       y: 402
       text: qsTr("Login")
       font.pointSize: 14
       onClicked: {
           loginbutton_clicked(passwordField.text);
       }
   }


   Text {
       id: failedtext
       objectName: "failedTextObj"
       x: 263
       y: 33
       color: "#ff0000"
       text: qsTr("")
       elide: Text.ElideMiddle
       anchors.bottom: parent.bottom
       font.pixelSize: 20
       horizontalAlignment: Text.AlignHCenter
       verticalAlignment: Text.AlignVCenter

       wrapMode: Text.NoWrap
       renderType: Text.QtRendering
       fontSizeMode: Text.Fit
       anchors.bottomMargin: 387
       textFormat: Text.PlainText
       styleColor: "#ff0000"
   }

   Flow {
       id: powerflow
       x: 321
       y: 402
       width: 240
       Button{

           width:powerflow.width / 16 * 3
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
       Text{
           width:powerflow.width / 16
       }

       Button{
           width:powerflow.width / 16 * 3
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
       Text{
           width:powerflow.width / 16
       }
       Button{
           width:powerflow.width / 16 * 3
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
       Text{
           width:powerflow.width / 16
       }
       Button{
           width:powerflow.width / 16 * 3
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




/*##^##
Designer {
    D{i:0;formeditorZoom:0.6600000262260437}
}
##^##*/
