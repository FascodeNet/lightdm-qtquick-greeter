import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Window 2.0
ApplicationWindow {

    id:greeter
    width: Screen.width
    height: Screen.height
    visible: true
    title: qsTr("Hello World")

    signal username_selected(string value);
    signal session_selected(string value);
    signal loginbutton_clicked(string value);
    signal erasebutton_clicked();
    signal enablebutton_clicked();
    signal disablebutton_clicked();
    signal logger(string value);
    Component.onCompleted:{
        var component = Qt.createComponent(theme_path);
        var greeter_obj=component.createObject(greeter)
        var maxX=Screen.width - greeter_obj.width;
        var maxY=Screen.height - greeter_obj.height;
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
        greeter_obj.x=offsetX;
        greeter_obj.y=offsetY;

    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
