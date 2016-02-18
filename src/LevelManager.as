package {
import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.FileFilter;
import flash.net.FileReference;

public class LevelManager {

    private var file:FileReference;

    public function showOpenFileDialog(event:MouseEvent):void
    {
        var mapFileTypes:FileFilter = new FileFilter("Maps (*.txt, *.map)", "*.txt;*.map");

        file = new FileReference();
        file.browse([mapFileTypes]);
        file.addEventListener(Event.SELECT, selectFileToOpen);
    }

    public function showSaveFileDialog(event:MouseEvent):void {
        file = new FileReference();
        file.save(MapEditor.instance.scene.toString(), "data.map");
        file.addEventListener(Event.SELECT, selectFileToSave);
    }

    private function selectFileToSave(event:Event):void {
        file.removeEventListener(Event.SELECT, selectFileToSave);
    }


    function selectFileToOpen(e:Event):void
    {
        file.removeEventListener(Event.SELECT, selectFileToOpen);
        file.addEventListener(Event.COMPLETE, loadFile);
        file.load();
    }

    function loadFile(e:Event):void
    {
        file.removeEventListener(Event.SELECT, loadFile);
        MapEditor.instance.scene.Init(file.data.toString());
    }

}
}
