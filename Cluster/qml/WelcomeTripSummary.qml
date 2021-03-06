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

import QtQuick 2.7

Item {
    anchors.fill: parent

    Column {
        anchors.centerIn: parent
        spacing: 20

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            Image {
                id: tripSummaryImage
                source: "../images/welcomeview_trip_info_icon.png"
            }

            Text {
                id: tripSummaryText
                anchors.verticalCenter: tripSummaryImage.verticalCenter
                text: "TRIP SUMMARY"
                font.pixelSize: 18
                color: "white"
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 50

            WelcomeInfoNote {
                firstline: "9:40"
                secondline: "Start time"
            }

            WelcomeInfoNote {
                firstline: "0:38"
                secondline: "Duration"
            }

            WelcomeInfoNote {
                firstline: "58"
                firstlineunit: "KM"
                secondline: "Distance"
            }
        }

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            height: 2
            width: 400
            color: "gray"
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 50

            WelcomeInfoNote {
                firstline: "324"
                firstlineunit: "WH"
                secondline: "Average\nenergy/km"
            }

            WelcomeInfoNote {
                firstline: "18.7"
                firstlineunit: "KWH"
                secondline: "Total energy"
            }

            WelcomeInfoNote {
                firstline: "60"
                firstlineunit: "KMH"
                secondline: "Average\nspeed"
            }
        }

        Image {
            // TODO: Image from route?
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../images/welcomeview_trip_route.png"
        }
    }
}
