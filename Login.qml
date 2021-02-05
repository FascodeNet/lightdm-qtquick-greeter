import QtQuick 2.4

import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
GridView {
    id: themeView
    width:350
    height: 250

   ComboBox {
       id: usercomboBox
       x: 105
       y: 73
       width:themeView.width * 0.5
       model:UserModels
   }
}




