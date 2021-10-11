import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

ApplicationWindow {
    id: applicationWindow
    visible: true;
    width: 640
    height: 480
    color: "#7ad7da"

    property int indexVar: -1

    ListModel {
        id: listmodelId
    }

    Rectangle{
        id: rectangleAVB
        anchors.left: parent.left
        anchors.right: comboboxId.left
        anchors.top: parent.top
        opacity: 0.494
        height: 50
        color: "lightgrey"
        Text {
            id: available
            color: "black"
            text: "AVAILABLE COURSES"
            anchors.verticalCenter: parent.verticalCenter
            anchors.top: parent.top
            minimumPointSize: 15
            minimumPixelSize: 15
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle{
        id: rectangleSLC
        anchors.left: comboboxId.right
        anchors.right: parent.right
        anchors.top: parent.top
        opacity: 0.494
        height: 50
        color: "lightgrey"
        Text {
            id: selected
            color: "black"
            text: "SELECTED COURSES"
            anchors.verticalCenter: parent.verticalCenter
            anchors.top: parent.top
            minimumPointSize: 15
            minimumPixelSize: 15
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Image{
        anchors.left: listviewId2.right
        anchors.right: listviewId.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "logo2.png"
        anchors.topMargin: 120
        anchors.bottomMargin: anchors.topMargin

    }

    ListModel {
        id:listmodel2
                ListElement
                        {
                            name: "CALCULUS I";
                            code: "151241195";
                            staff: "Doç .Dr. Özge YANAZ ÇINAR";
                            credits: "4"
                        }
                ListElement
                        {
                            name: "CHEMISTRY";
                            code: "151241195";
                            staff: "Dr. Öğr. Üyesi Recep YÜKSEL";
                            credits: "3"
                        }
                ListElement
                        {
                            name: "EXPOSITORY WRITING";
                            code: "151241132";
                            staff: "Okt. Merih YILDIZ";
                            credits: "3"
                        }
                ListElement
                        {
                            name: "PHYSICS I";
                            code: "151241198";
                            staff: "Doç. Dr. Sertaç EROĞLU";
                            credits: "3"
                            fill:"lightsteelblue"
                        }
                ListElement
                        {
                            name: "ADVANCED CALCULUS";
                            code: "151243559";
                            staff: "Prof. Dr. Abdurrahman KARAMANCIOĞLU";
                            credits: "4"
                        }
                ListElement
                        {
                            name: "CIRCUIT ANALYSIS I";
                            code: "151243555";
                            staff: "Doç .Dr. Semih ERGİN";
                            credits: "4"
                        }
                ListElement
                        {
                            name: "DIGITAL SYSTEMS I";
                            code: "151243557";
                            staff: "Dr. Öğr. Üyesi Gökhan DINDIŞ";
                            credits: "4"
                        }
                ListElement
                        {
                            name: "ELECTROMAGNETICS I";
                            code: "151243558";
                            staff: "Prof. Dr. Gökhan ÇINAR";
                            credits: "3"
                        }
                ListElement
                        {
                            name: "DIGITAL SYSTEMS II";
                            code: "151244555";
                            staff: "Prof. Dr. Salih FADIL";
                            credits:"4"
                        }
                ListElement
                        {
                            name: "CIRCUIT ANALYSIS II";
                            code: "151244232";
                            staff: "Prof. Dr. Osman PARLAKTUNA";
                            credits: "4"
                        }
                ListElement
                        {
                            name: "ELECTRONICS I";
                            code: "151245335 ";
                            staff: "Dr. Öğr. Üyesi Faruk DİRİSAĞLIK";
                            credits: "3"
                        }
                ListElement
                        {
                            name: "MICROCOMPUTERS";
                            code: "151245405";
                            staff: "Prof. Dr. Salih FADIL";
                            credits: "3"
                        }
                ListElement
                        {
                            name: "ECONOMICS";
                            code: "151247437";
                            staff: "Öğr. Gör. Dr. Ömer KARA";
                            credits: "3"
                        }
                ListElement
                        {
                            name: "PROJECT MANAGEMENT";
                            code: "151246376";
                            staff: "Dr. Öğr. Üyesi Burak URAZEL";
                            credits: "2"
                        }
                ListElement
                        {
                            name: "DESIGN PROCESSES";
                            code: "151247644";
                            staff: "Dr. İpek ÇETİNBAŞ";
                            credits: "2"
                        }
            }

    ComboBox {
        id: comboboxId
        width: parent.width / 3
        height: 50
        opacity: 0.494

        anchors.top: parent.top
        clip: true
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            text: "SELECT"
            anchors.verticalCenter: parent.verticalCenter
            anchors.top: parent.top
            minimumPointSize: 15
            minimumPixelSize: 15
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }
        model: listmodel2
        delegate: Rectangle{
            width: parent.width
            height: 50
            color: "#7ad7da"
            Row {
                spacing: 5
                anchors.fill: parent
                anchors.margins: 5
                CheckDelegate {
                    id: checkboxId
                    property alias checkboxId: checkboxId
                    height: parent.height
                    width: height
                    onCheckStateChanged: {
                        console.log("index= "+index)
                        if (checkState === Qt.Checked){
                            listmodelId.append({ "name": name, "code":code, "staff": staff, "credits":credits})
                            indexVar = index
                        }
                        if(checkState === Qt.Unchecked) {
                            listmodelId.remove(CheckDelegate.highlightedIndex)
                            indexVar = index
                        }
                    }
                }
                Label {
                    text: name
                    width: parent.width - checkboxId.width
                    height: parent.height
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                }
            }
        }
    }


    ListView {
        id: listviewId
        width: parent.width / 3
        height: parent.height
        anchors.right: parent.right
        anchors.top: rectangleSLC.bottom
        clip: true
        model: listmodelId
        delegate: Item {
            height: 60
            width: parent.width
            Rectangle {
                id: rectangle
                border.color: "black"
                color: "#171796"
                anchors.fill: parent
                Text {
                    color:"white"
                    text: name+"     "+code
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    color:"white"
                    text: "credit= "+credits
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Button{
                    id: button
                    background:
                        Rectangle{
                            height: 20
                            width: 20
                            color: "#171796"
                            border.color: "black"
                            Text {
                                anchors.centerIn: parent
                                id: buttonText
                                text: "X"
                                color: "black"
                            }
                        }
                    onClicked:{
                        listmodelId.remove(index)
                    }
                }
            }
        }
        onCountChanged: console.log(count)
    }

    ListView {
        id: listviewId2
        width: parent.width / 3
        height: parent.height
        anchors.left: parent.left
        anchors.top: rectangleAVB.bottom
        clip: true
        model: listmodel2
        delegate: Item {
            height: 60
            width: parent.width
            Rectangle {
                id: rectangle2
                border.color: "black"
                color: index == indexVar ? "lightsteelblue" : "#171796"
                anchors.fill: parent
                Text {
                    color:"white"
                    text: name+"     "+code
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    color:"white"
                    text: staff
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    color:"white"
                    text: "credit= "+credits
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}
