
pragma Singleton

import QtQuick

QtObject {

    readonly property font tabButton: ({
        family: "Segoe UI Variable",
        pixelSize: 12,
        weight: 600
    })

    readonly property font toolButton: ({
        family: "Segoe UI Variable",
        pixelSize: 14,
        weight: 600
    })

    readonly property font menuItem: ({
        family: "Segoe UI Variable",
        pixelSize: 13,
        weight: 600
    })

    readonly property font statusBar: ({
        family: "Segoe UI Variable",
        pixelSize: 11,
        weight: Font.Normal
    })

}
