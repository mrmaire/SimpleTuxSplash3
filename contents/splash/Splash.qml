import QtQuick 2.5


Rectangle {
    id: root
    color: "#111111"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }


    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }


        Image {
            id: logo
            //match SDDM/lockscreen avatar positioning
            property real size: units.gridUnit * 24

            anchors.centerIn: parent

            source: "images/tux.png"

            sourceSize.width: size
            sourceSize.height: size
        }

      AnimatedSprite {
        source: "images/busy-bar-sprite4.png"
        frameWidth: 224
        frameHeight: 56
        frameCount: 32
       frameDuration: 75
       interpolate: false
        anchors {
            bottom: parent.bottom
            bottomMargin: 400
            horizontalCenter: parent.horizontalCenter
        }
      }

    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
