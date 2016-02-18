package ui {
import flash.display.Sprite;
import flash.geom.Point;
import flash.text.TextField;

public class ButtonDisplayState extends Sprite {
    private var bgColor:uint;
    private var size:Point;

    public function ButtonDisplayState(bgColor:uint, size:Point, text:String) {

        this.bgColor = bgColor;
        this.size = size;
        draw();
        var textField:TextField = new TextField();
        textField.text = text;
        textField.height = size.y;
        textField.width = size.x;
        addChild(textField);

    }

    private function draw():void {
        graphics.beginFill(bgColor);
        graphics.drawRect(0, 0, size.x, size.y);
        graphics.endFill();
    }
}
}
