package;

import hxPixels.Pixels;
import hxRectPack2D.pixels.Wrapper;
import hxRectPack2D.pixels.Helper;
import hxRectPack2D.atlas.AtlasBuilder;
import folder.Folder;

#if neko
import neko.vm.Module;
#end

class Main {
    var assets = './assets/';
    var outputFolder = 'rectPack';
    var folder = new Folder();
    public static 
    function main() { new Main(); }
    public
    function new(){
        loadAndPrepareImages();
    }
    function loadAndPrepareImages(){
        var arrImgSpec  = folder.getImages( assets );
        var arrImages   = new Array<Wrapper>();
        var names       = new Array<String>();
        var spec: ImageSpec;
        for( i in 0...arrImgSpec.length ) {
            spec = arrImgSpec[ i ];
            arrImages[ i ]  = new Wrapper( spec.pixels );
            names[ i ]      = spec.fileSpec.name;
        }
        Sys.println( 'total images ' + arrImages.length );
        getPixelAtlas( arrImages, names, 300 );
    }
    function getPixelAtlas( arrImages: Array<Wrapper>, names: Array<String>, height ){
        var atlasBuilder = new AtlasBuilder();
        var width = atlasBuilder.generatePackingData( cast arrImages, names, height );
        Sys.println( 'width ' + width );
        var outputPng = new Pixels( width, height, true );
        var newFolder = assets + outputFolder;
        folder.deleteDirectory( newFolder );
        folder.createDirectory( newFolder );
        var atlas: Atlas = atlasBuilder.getAtlas( newFolder +'/zebraAtlas.png', cast new Wrapper( outputPng ) );
        folder.savePNG( outputPng, newFolder + '/zebraAtlas.png' );
        folder.saveText( newFolder +'/zebra_Atlas.json', atlas.jsonString );
    }
}