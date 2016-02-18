package ui {
import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.utils.Timer;

public class Gui extends Sprite{
    public var currentHeight:TextField = new TextField();
    private var timer:Timer;
    private var positionTextField:TextField = new TextField();
    private var loadButton:UIButton;
    private var saveButton:UIButton;
    public function Gui() {
        super();
        currentHeight.textColor = 0xffffff;
        addChild(currentHeight);

        loadButton = new UIButton("Load map", function(event:MouseEvent):void {
            var manager:LevelManager = new LevelManager();
            manager.showOpenFileDialog(event);
        });
        loadButton.y = 140;
        addChild(loadButton);

        saveButton = new UIButton("Save map", function(event:MouseEvent):void {
            var manager:LevelManager = new LevelManager();
            manager.showSaveFileDialog(event);

        });
        saveButton.y = 180;
        addChild(saveButton);

        addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {

    }
}
}
