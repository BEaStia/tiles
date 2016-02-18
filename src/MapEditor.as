package {

import as3isolib.display.IsoView;
import as3isolib.geom.Pt;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.utils.ByteArray;
import ui.Gui;

[SWF(backgroundColor='#000000' )]
public class MapEditor extends Sprite {


    private var viewPort:IsoView;

    public var scene:World;

    public var gui:Gui;
    public static var selectedBox:TileBox;

    public static var previousX:Number = 0;
    public static var previousY:Number = 0;

    private static var _instance:MapEditor;
    private var isPan:Boolean = false;

    public static function get instance():MapEditor {
        return _instance;
    }


    public function MapEditor() {
        _instance = this;

        viewPort = new IsoView();
        viewPort.setSize(1280, 800);
        viewPort.centerOnPt(new Pt(300, 200, 0), false);
        addChildAt(viewPort, 0);

        viewPort.addEventListener(MouseEvent.MOUSE_WHEEL, onZoom, false, 0, true);
        stage.addEventListener(MouseEvent.MOUSE_DOWN, onStartPan);

        stage.addEventListener(MouseEvent.MOUSE_UP, Deselect, false, 0, true);
        addEventListener(Event.DEACTIVATE, Deselect);

        addEventListener(Event.ENTER_FRAME, onRender, false, 0, true);

        scene = new World();
        scene.Init();
        viewPort.addScene(scene);

        gui = new Gui();
        addChild(gui);
    }

    private function Deselect(event:Event):void {
        isPan = false;
        selectedBox = null;
    }

    private function onRender(event:Event):void {
        scene.render();
        var dx:Number = previousX - stage.mouseX;
        var dy:Number = previousY - stage.mouseY;
        previousX = stage.mouseX;
        previousY = stage.mouseY;

        if (selectedBox != null) {
            selectedBox.MoveUp(dy);
            gui.currentHeight.text = selectedBox.mapHeight.toString();
        } else if (isPan)
            viewPort.panBy(dx, dy);
    }

    private function onStartPan(event:MouseEvent):void {
        isPan = true;
    }

    private function onZoom(event:MouseEvent):void {
        trace(event.delta);
    }

    public function loadLevel(ba:ByteArray):void {

    }
}
}
