import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.kirigami 2.7 as Kirigami
import "components" as Components

PlasmoidItem {
    id: root

    compactRepresentation: MouseArea {
        id: compactRoot

        readonly property bool tooSmall: Plasmoid.formFactor === PlasmaCore.Types.Horizontal &&
                                         Math.round(2 * (compactRoot.height / 5)) <= PlasmaCore.Theme.smallestFont.pixelSize

        Layout.minimumWidth: isVertical ? 0 : compactRow.implicitWidth
        Layout.maximumWidth: isVertical ? Infinity : Layout.minimumWidth
        Layout.preferredWidth: isVertical ? undefined : Layout.minimumWidth

        // 💡 Replaced label.height with fallback height
        Layout.minimumHeight: isVertical ?  Kirigami.Theme.defaultFont.pixelSize : Kirigami.Theme.smallestFont.pixelSize
        Layout.maximumHeight: isVertical ? Layout.minimumHeight : Infinity
        Layout.preferredHeight: isVertical ? Layout.minimumHeight : Kirigami.Theme.defaultFont.pixelSize * 2

        property bool wasExpanded
        onPressed: wasExpanded = root.expanded
        onClicked: root.expanded = !wasExpanded

        Row {
            id: compactRow
            layoutDirection: iconPositionRight ? Qt.RightToLeft : Qt.LeftToRight
            anchors.centerIn: parent
            spacing: Kirigami.Units.smallSpacing

            Rectangle {
                width: root.height
                height: root.height
                color: "transparent"

                Kirigami.Icon {
                    width: 22
                    height: 22
                    source: "configure"
                    anchors.centerIn: parent
                }
            }
        }
    }

    fullRepresentation: FullRepresentation {
    }
}
