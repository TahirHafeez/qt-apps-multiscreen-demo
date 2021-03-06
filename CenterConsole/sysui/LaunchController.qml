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

import QtQuick 2.5
import QtQuick.Controls 1.0
import controls 1.0
import utils 1.0
import models 1.0

StackView {
    id: root
    focus: true

    property int duration: 500

    delegate: StackViewDelegate {

        pushTransition: StackViewTransition {
            PropertyAnimation {
                target: enterItem;
                property: "opacity";
                from: 0
                to: 1;
                duration: root.duration
            }
        }

        popTransition: StackViewTransition {
            id: popTransition

            PropertyAnimation {
                target: exitItem
                property: "opacity"
                from: 1
                to: 0
                duration: root.duration
            }
        }
    }

    Item {
        id: dummyitem
        anchors.fill: parent
        //visible: false
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequence: StandardKey.Cancel
        onActivated: { root.pop(null) }
    }

    Connections {
        target: ApplicationManagerInterface

        onApplicationSurfaceReady: {
            root.push(item)
        }

        onReleaseApplicationSurface: {
            root.pop(null)
        }
    }
}
