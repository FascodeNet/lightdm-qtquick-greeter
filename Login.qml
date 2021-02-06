import QtQuick 2.4

import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
GridView {
    id: themeView
    width:800
    height:450
    Image {
        id: usericonimage
        x: 351
        y: 127
        width: 100
        height: 100
        source: UserIconSrc
        fillMode: Image.PreserveAspectFit
    }
   ComboBox {
       id: usercomboBox
       x: 201
       y: 233
       width:themeView.width * 0.5
       model:UserModels
       onActivated: username_selected(currentValue)
   }

   Text {
       id: text1
       x: 379
       y: 77
       text: qsTr("User")
       font.pixelSize: 20
   }

   TextField {
       id: textField
       x: 201
       y: 292
       width:themeView.width * 0.5
       text: ""
       hoverEnabled: true
       placeholderText: "Password"
       echoMode: TextInput.PasswordEchoOnEdit
   }

}



