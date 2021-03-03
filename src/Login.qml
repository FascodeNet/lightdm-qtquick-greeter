import QtQuick 2.4

import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
GridView {
    id: themeView
    width:800
    height:450
    Image {
        id: usericonimage
        x: 208
        y: 165
        width: 70
        height: 70
        source: UserIconSrc
        fillMode: Image.PreserveAspectFit
    }
   ComboBox {
       id: usercomboBox
       x: 552
       y: 165
       width: 40
       height: 70
       model:UserModels
       onCurrentValueChanged: username_selected(currentValue)
   }

   Text {
       id: text1
       x: 284
       y: 165
       width: 262
       height: 35
       text: UserName
       font.pixelSize: 20
       style: Text.Outline
       styleColor: "#ffffff"
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
       y: 251
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
       styleColor: "#ffffff"
       style:Text.Outline;
   }

   Button {
       id: loginbutton
       x: 201
       y: 297
       width: 400
       height: 40
       text: qsTr("Login")
       font.pointSize: 14
       onClicked: {
           loginbutton_clicked(passwordField.text);
       }
   }


   Flow {
       id: powerflow
       x: 552
       y: 403
       width: 240
       height: 40
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

   Text {
       id: text3
       x: 284
       y: 200
       width: 262
       height: 35
       text: qsTr("サブテキスト")
       font.pixelSize: 20
       styleColor: "#ffffff"
       style: Text.Outline
   }

   Image {
       id: usericonimage1
       x: 245
       y: 20
       width: 312
       height: 80
       source: UserIconSrc
       fillMode: Image.PreserveAspectFit
   }

}







