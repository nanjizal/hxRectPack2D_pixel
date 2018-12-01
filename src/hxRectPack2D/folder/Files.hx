package hxRectPack2D.folder;
import hxRectPack2D.output.BodyFrames;
import hxRectPack2D.output.TP;
import hxPixels.Pixels;
import folder.Folder;
typedef FileFolderNames = {
    public var directory:    String;
    public var subDirectory: String;
    public var json:   String;
    public var atlas:  String;
}
class Files{
    var folder           = new Folder();
    var fileFolderNames: FileFolderNames;
    var newFolder:       String;
    public function new( fileFolderNames_: FileFolderNames ){
        fileFolderNames = fileFolderNames_;
        newFolder = fileFolderNames.directory + fileFolderNames.subDirectory;
    }
    public
    function getImages():Array<ImageSpec> {
        return folder.getImages( fileFolderNames.directory );
    }
    public
    function getPixels( inputAtlas: String ): Pixels {
        return folder.getPNG( fileFolderNames.directory + inputAtlas );
    }
    public
    function getBodyFrame( inputJson: String ): BodyFrames {
        var bodyParts = folder.loadText( fileFolderNames.directory + inputJson );
        return new BodyFrames( bodyParts );
    }
    public inline
    function outputImage(){
        return fileFolderNames.atlas;
    }
    public inline
    function outputImagePath(){
        return newFolder + '/' + fileFolderNames.atlas;
    }
    public inline
    function outputJsonPath(){
        return newFolder + '/' + fileFolderNames.json;
    }
    public inline
    function rebuildDirectory(){
        folder.deleteDirectory( newFolder );
        folder.createDirectory( newFolder );
    }
    public inline
    function savePixels( pixels: Pixels, fileName: String ){
        folder.savePNG( pixels, newFolder + '/' + fileName );
    }
    public
    function saveAtlas( pixels: Pixels, jsonString: String ){
        rebuildDirectory();
        folder.savePNG( pixels, outputImagePath() );
        folder.saveText( outputJsonPath(), jsonString );
    }
    public
    function checkSavedData(){ // for checking saved data
        var s = folder.loadText( outputJsonPath() );
        var framesHolder = TP.reconstruct( s );
        var tp = TP.frameHolderToTP( framesHolder );
        out( tp.write() );
        TP.frameHolderTraceImages( framesHolder );
    }
    public static inline
    function traceLimbs( bodyFrames: BodyFrames ){ // for debugging
        var traceNames =  bodyFrames.getNames();
        for( n in traceNames ) out( n );
    }
    public static inline
    function out( data: Dynamic ){
        #if sys
            Sys.println( data );
        #else
            trace( data );
        #end
    }
}