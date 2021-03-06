/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt multiscreen demo application.
**
** $QT_BEGIN_LICENSE:GPL-EXCEPT$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.0
import controls 1.0
import utils 1.0
import service.valuesource 1.0
import "."
import com.pelagicore.ScreenManager 1.0

AppUIScreen {
    id: root
    title: "Car info"
    color: "black"

    Component.onCompleted: {
        if (ScreenManager.screenCount() > 1) {
            clusterComponent = Qt.createComponent("ClusterWidget.qml")
        } else {
            console.log("Cannot show widget in cluster")
        }
        if (clusterComponent.status === Component.Ready) {
            cluster = clusterComponent.createObject(root, {"total": ValueSource.totalDistance,
                                                 "sinceLast": ValueSource.kmSinceCharge })
        }
    }

    UIScreen {
        width: Style.screenWidth
        height: Style.screenHeight - Style.bottomBarHeight - Style.statusBarHeight
        onBackScreen: root.back()
        title: "Car info"

        ColumnLayout {
            anchors.fill: parent
            anchors.topMargin: 200
            anchors.leftMargin: 30

            Row {
                Layout.alignment: Qt.AlignCenter
                Label {
                    text: "Ready for the road."
                    font.pixelSize: Style.fontSizeXXL
                }
            }
            RowLayout {
                Layout.alignment: Qt.AlignCenter
                spacing: 30
                Rectangle {
                    height: 2
                    color: "white"
                    width: 300
                }
                Label {
                    Layout.alignment: Qt.AlignCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    text: "Status"
                }
                Rectangle {
                    height: 2
                    color: "white"
                    width: 300
                }
            }
            Row {
                Layout.alignment: Qt.AlignCenter
                spacing: 50
                CarInfoField{ value: ValueSource.totalDistance.toFixed(); title: "Total\ndistance" }
                CarInfoField{ value: ValueSource.kmSinceCharge; title: "Since last\nCharge" }
                CarInfoField{ value: ValueSource.avRangePerCharge; title: "Average\nrange/charge" }
                CarInfoField{ value: ValueSource.energyPerKm; title: "energy/km"; unit: "WH" }
            }
            Rectangle {
                Layout.alignment: Qt.AlignCenter
                height: 2
                color: "white"
                width: 750
            }

            Image {
                Layout.alignment: Qt.AlignCenter
                source: Style.symbol("CarInfo")
            }
        }
    }
}
