package {
import as3isolib.display.scene.IsoGrid;
import as3isolib.display.scene.IsoScene;

import eDpLib.events.ProxyEvent;

import flash.events.MouseEvent;

public class World extends IsoScene {
    private var cells:Array;

    public function World() {
        super();
    }

    public function Init(configuration:String = ""):void {
        removeAllChildren();


        var _configuration:Array = [];
        if (configuration != "") {
            _configuration = configuration.split("\n").map(function (el:String, index:int, arr:Array):Array {
                return el.split(" ").map(function(stringNumber:String, _index:int, _arr:Array):int {
                    return parseInt(stringNumber);
                });
            });
        }

        function getHeight(_i:int, _j:int):int {
            if (configuration == "")
                return 0;
            return _configuration[_i][_j];
        }

        cells = new Array();
        var COUNT_Y:int = 10;
        for(var i:int = 0; i < COUNT_Y; i++) {
            var row:Array = new Array();
            var COUNT_X:int = 10;
            for(var j:int = 0; j < COUNT_X; j++) {
                var SIZE:int = 16;
                var isoBox:TileBox = new TileBox(SIZE, j, i, 0);
                isoBox.MoveUp(getHeight(i, j));
                addChild(isoBox);
                row.push(isoBox);
            }
            cells.push(row);
        }

    }

    public function toString():String {
        var result:String = "";
        var COUNT_Y:int = 10;
        for (var i:int = 0; i < COUNT_Y; i++) {
            var COUNT_X:int = 10;
            for(var j:int = 0; j < COUNT_X; j++) {
                result += (cells[i][j] as TileBox).mapHeight;
                if (COUNT_X < 9)
                    result += " ";
            }
            if (COUNT_Y < 9)
                result += "\n";
        }
        return result;
    }


}
}
