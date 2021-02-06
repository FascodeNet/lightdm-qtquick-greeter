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

   TextField {
       id: passwordField
       x: 201
       y: 292
       width:themeView.width * 0.5
       text: ""
       hoverEnabled: true
       placeholderText: "Password"
       echoMode: TextInput.Password
       onAccepted: loginbutton_clicked(text);
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

}



