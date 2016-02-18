package ui {
import flash.display.DisplayObject;
import flash.display.SimpleButton;
import flash.events.MouseEvent;
import flash.geom.Point;

public class UIButton extends SimpleButton {

    public function UIButton(text:String, callback:Function) {
        var size:uint = 60;
        var downColor:uint = 0x00CCFF;
        downState      = new ButtonDisplayState(downColor, new Point(size, size/4), text);
        var overColor:uint = 0xCCFF00;
        overState      = new ButtonDisplayState(overColor, new Point(size, size/4), text);
        var upColor:uint = 0xFFCC00;
        upState        = new ButtonDisplayState(upColor, new Point(size, size/4), text);
        hitTestState   = new ButtonDisplayState(upColor, new Point(size, size/4), text);
        useHandCursor  = true;
        addEventListener(MouseEvent.CLICK, callback);
    }
}

}
