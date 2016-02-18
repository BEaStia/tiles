package {
import as3isolib.display.primitive.IsoBox;
import eDpLib.events.ProxyEvent;
import flash.events.MouseEvent;

public class TileBox extends IsoBox {

    public function TileBox(size:Number, _x:Number, _y:Number, _z:Number) {
        super(null);
        setSize(size, size, 0);
        moveTo(_x * size, _y * size, _z * size);
        addEventListener(MouseEvent.MOUSE_DOWN, onMouseClick);
    }

    private function onMouseClick(event:ProxyEvent):void {
        MapEditor.previousY = (event.targetEvent as MouseEvent).stageY;
        MapEditor.selectedBox = this;
    }

    public function MoveUp(dy:Number):void {
        var nextHeight:Number = height + z + dy;
        if ((z + dy > 0 && z != 0) || (height + dy >= 0 && (z == 0))) {
            mapHeight = nextHeight;
        } else {
            mapHeight = z + dy;
        }
    }

    public function set mapHeight(value:int):void {
        if (value >= 0) {
            if (value >= 150)
                height = 150;
            if (value > 0 && value < 150)
                height = value;
            z = 0;
        } else {
            if (value >= -150)
                z = value;
            else
                z = -150;
            height = Math.abs(z);
        }
    }

    public function get mapHeight():int {
        if (z == 0) {
            return height;
        } else {
            return z;
        }
    }
}
}
