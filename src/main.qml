import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Window 2.0
ApplicationWindow {

    id:greeter
    width: Screen_width
    height: Screen_height
    x:Screen_x
    y:Screen_y
    visible: true
    title: qsTr("Hello World")

    signal username_selected(string value);
    signal session_selected(string value);
    signal loginbutton_clicked(string value);
    signal erasebutton_clicked();
    signal enablebutton_clicked();
    signal disablebutton_clicked();
    signal logger(string value);
    signal shutdown();
    signal reboot();
    signal hibernate();
    signal suspend();
    signal loaded();
    signal set_background(string value);
    signal cursor_move_center(var width,var height);
    Image {
        id: backgroundkun
        objectName: "background_obj"
    }
    Component.onCompleted:{
        var component = Qt.createComponent(theme_path);
        var greeter_obj=component.createObject(greeter)
        cursor_move_center(Screen_width,Screen_height);
        loaded();
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
