import bb.cascades 1.0
import bb.multimedia 1.0

Page {
    id: pageAudio
    property int minAudio
    property int secAudio
    property int minTotalAudio
    property int secTotalAudio
    property bool seekInProgress: false

    Container {
        id: contAudio
        background: Color.create("#ff212121")

        layout: DockLayout {

        }

        ImageView {
            id: imgAudio
            imageSource: "asset:///images/imgAudio.jpg"
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
        } //id:imgAudio

        Container {
            id: contAudioControl
            background: Color.create("#ff636363")
            rightPadding: 10
            leftPadding: 10
            topPadding: 10
            bottomPadding: 10

            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Bottom

            Slider {
                id: barControl
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Center
                bottomMargin: 0
                fromValue: 0
                toValue: player.duration
                
                onTouch: {
                    if (event.isDown()) {
                        pageAudio.seekInProgress = true;
                        player.pause();
                    }
                }
                
                onValueChanged: {
                    if (pageAudio.seekInProgress) {
                        player.seekTime(value)
                        pageAudio.seekInProgress = false;
                        player.play()
                    }
                }
                
            } //barControl

            Container {
                id: contTxtTime
                horizontalAlignment: HorizontalAlignment.Fill

                layout: DockLayout {
                }

                Label {
                    id: txtTime
                    text: qsTr("%1:%2").arg(pageAudio.minAudio < 10 ? "0" + pageAudio.minAudio : "" + pageAudio.minAudio).arg(pageAudio.secAudio < 10 ? "0" + pageAudio.secAudio : "" + pageAudio.secAudio)
                    textStyle.fontSize: FontSize.Small
                } //txtTime

                Label {
                    id: txtTotalTime
                    text: qsTr("%1:%2").arg(pageAudio.minTotalAudio < 10 ? "0" + pageAudio.minTotalAudio : "" + pageAudio.minTotalAudio).arg(pageAudio.secTotalAudio < 10 ? "0" + pageAudio.secTotalAudio : "" + pageAudio.secTotalAudio)
                    textStyle.fontSize: FontSize.Small
                    horizontalAlignment: HorizontalAlignment.Right
                } //txtTotalTime

            } //contTxtTime

        } //contAudioControl

    } //contAudio

    attachedObjects: [
        MediaPlayer {
            id: player
            sourceUrl: "audio.mp3"

            onPositionChanged: {

                if (! pageAudio.seekInProgress) {
                    barControl.value = position;
                }

                pageAudio.minAudio = Math.floor(barControl.value / 1000 / 60)
                pageAudio.secAudio = Math.floor(barControl.value / 1000 % 60)

            }

            onBuffering: {
                pageAudio.minTotalAudio = Math.floor(player.duration / 1000 / 60)
                pageAudio.secTotalAudio = Math.floor(player.duration / 1000 % 60)
            }

        }

    ]

    actions: [
        ActionItem {
            id: btnPlay
            title: "Play"
            imageSource: "asset:///images/icoPlay.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                player.play();
            }
        },
        ActionItem {
            id: btnStop
            title: "Stop"
            imageSource: "asset:///images/icoStop.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                player.stop();
                barControl.resetValue();
                pageAudio.minAudio = Math.floor(barControl.value / 1000 / 60)
                pageAudio.secAudio = Math.floor(barControl.value / 1000 % 60)
                
            }
        }
    ]

}//pageAudio
