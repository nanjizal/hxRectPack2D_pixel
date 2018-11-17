package;
import sys.io.File;
import sys.io.FileInput;
import sys.io.FileOutput;
import format.png.Writer;
import format.png.Tools;
import haxe.io.Path;
import haxe.io.Bytes;

import hxRectPack2D.RectPack2D;
import hxRectPack2D.rectangle.XYWHF;
import hxRectPack2D.data.Bin;
import hxRectPack2D.output.TP;
import hxPixels.Pixels;

#if neko
import neko.vm.Module;
#end

class Main {
    var blocks          = new Array<XYWHF>();
    var bins            = new Array<Bin>();
    var packSize        = 400;
    var totalBlocks     = 200;
    var minSize         = 3;
    var maxSize         = 150;
    var pixelSheet      :Pixels;
    var names           = new Array<String>();
    var pixelImages     : Array<Pixels>;
    var tp = new TP();
    var wid: Int;
    var hi: Int;
    public static 
    function main() {
        
    }
    function getImagesFromFolder(): Array<Pixels> {
        // NOT implemented     pixelImage
    }
    inline
    function createBlocks(){
        var pixels: Pixels;
        for( i in 0...pixelImages.length ){
            pixels = pixelImages[ i ];
            blocks[ i ] = new XYWHF( 0, 0, pixels.width, pixels.height );
        }
    }
    inline
    function Pack(){
        RectPack2D.pack( blocks, packSize, bins );
        wid = packSize*bins.length;
        hi = packSize;
        tp.metaDefine( 'output.png', wid, hi );
        pixelSheet = new Pixels( wid, hi );
    }
    inline
    function renderToSheet(): Void {
        var block: XYWHF;
        var left:   Int;
        var top:    Int;
        var wid:    Int;
        var hi:     Int;
        var flipped:Bool;
        var pixelImg: Pixels;
        var name: String;
        for ( j in 0...bins.length ){
            var bin0 = bins[ j ].rects;
            var xoff = j*packSize;
            for( i in 0...bin0.length ){
                block = bin0[ i ];
                left    = xoff + block.x;
                top     = block.y;
                wid     = block.w;
                hi      = block.h;
                flipped = block.flipped;
                pixleImg = pixelsImages[ block.id ];
                name = names[ block.id ];
                if( flipped ){
                    PixelHelper.drawImage32AntiClockWise( 0, 0, left, top, pixleImg, pixelsSheet );
                } else {
                    PixelHelper.drawImage32( 0, 0, left, top, pixelsImg, pixelsSheet );
                }
                tp.frameDefine( name, location, block );
            }
        }
        g.end();
    }
    function saveToPNG( pixels: Pixels, fileName: String ) {
        trace( 'saveToPNG' );
        var pixels = pixelsSheet;
        var file = File.write( filePath( fileName ), true );
        var pngWriter = new Writer( file );
        pixels.convertTo( PixelFormat.ARGB );
        var pngData = Tools.build32ARGB( pixels.width, pixels.height, pixels.bytes );
        pngWriter.write( pngData );
    }
    function loadFile( fileName: String ){
        trace( 'load image' );
        return File.getContent( filePath( fileName ) );
    }
    function filePath( fname: String ){
        return Path.join( [ dir, fname ] );
    }
    public var dir( get, never ): String;
    function get_dir(): String {
        #if neko
        var dir = Path.directory( Module.local().name );
        #else
        var dir = Path.directory( Sys.executablePath() );
        #end
        return dir;
    }
}