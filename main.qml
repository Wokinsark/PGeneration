import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQml.Models 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import "Main.js" as JS
import generation 1.0

ApplicationWindow {
    visible: true
    width: 950
    height: 180
    title: qsTr("Генератор паролей")

    property string tX: "0"
    property string tY: "0"
    property string tT: "0"
    property string tC: "0"
    property string tR: "0"
    property string gamma: ""

    property int count: 0

    Component.onCompleted: {
        setX(Screen.width / 2 - width / 2);
        setY(Screen.height / 2 - height / 2);
    }

    Action{
        shortcut: "Esc"
        onTriggered: close()
    }

    MouseArea {        
        anchors.fill: parent
        acceptedButtons : Qt.RightButton
        onPressed: JS.updateGUI(true)
        onPositionChanged: JS.positionChanged(mouse)
        onReleased: JS.updateGUI(false)
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 5
        GroupBox{
            id:gbActive
            Layout.fillWidth: true
            Text{
                anchors.fill: parent
                verticalAlignment :Text.AlignVCenter
                horizontalAlignment:Text.AlignHCenter
                text:"Зажмите ПРАВУЮ кнопку мыши на приложении\nи водите по всему ЭКРАНУ"
            }
        }
        RowLayout{
            id: rlInfo
            visible: false
            Layout.fillWidth: true
            Text{
                text:"X:"
            }
            Text{
                text:tX
            }
            Text{
                text:"Y:"
            }
            Text{
                text:tY
            }
            Text{
                text:"T:"
            }
            Text{
                text:tT
            }
            Text{
                text:"C:"
            }
            Text{
                text:tC
            }
            Text{
                text:"R:"
            }
            Text{
                text:tR
            }
        }
        RowLayout{
            Layout.fillWidth: true
            Text{
                id: tProgress
                visible: false
                text:"Текущий прогресс:"
            }
            ProgressBar{
                id:progressCurrent
                Layout.fillWidth: true
                value: 0
                visible: false
                maximumValue: 512
            }            
            Text{
                id: tLength
                text:"Количество символов пароля:"
            }
            SpinBox{
                id: sbLength
                value: 1
                minimumValue: 1
                maximumValue: 86
                onValueChanged: JS.resetPassword()
            }
        }
        RowLayout{
            Layout.fillWidth: true
            GroupBox{
                title: "Пароль"
                Layout.fillWidth: true
                TextField{
                    anchors.fill: parent
                    id: tfPassword
                    text:"*"
                    readOnly: true
                }
            }
        }
    }

    MessageDialog {
        id: messageInformation
        standardButtons : StandardButton.Ok
        icon : StandardIcon.Information
        title: "Информация"
        text: "Важная информация"
    }

    Generation{
        id: generation
    }
}
