pub struct Canvas {

  pub let width: UInt8
  pub let height: UInt8
  pub let pixels: String

  init(width: UInt8, height: UInt8, pixels: String) {
    self.width = width
    self.height = height
    // The following pixels
    // 123
    // 456
    // 789
    // should be serialized as
    // 123456789
    self.pixels = pixels
  }
}





pub fun serializeStringArray(_ lines: [String]): String {
  var buffer = ""
  for line in lines {
    buffer = buffer.concat(line)
  }

  return buffer
}


pub resource Picture {
  pub let canvas: Canvas
  
  init(canvas: Canvas) {
    self.canvas = canvas
  }
}
pub fun display(canvas: Canvas) {let width =Int(canvas.width)
let height = Int(canvas.height)-1
var lineCounter =0
var columnCounter = 0
var horizontalBorder = "+"
while columnCounter < width {horizontalBorder= horizontalBorder.concat("-"
);columnCounter = columnCounter + 1}
horizontalBorder = horizontalBorder.concat("+")
log(horizontalBorder)
while lineCounter <= height {
  let from = lineCounter * width
  let upTo = from + width <=canvas.pixels.length ?
  from + width :
  canvas.pixels.length
  let lineString = "|"
  .concat(canvas.pixels.slice(from: from, upTo:upTo))
  .concat("|")
  log(lineString)
  lineCounter = lineCounter + 1
}
log(horizontalBorder)
}

pub fun main() {
  let pixelsX = [

" *   * "
"  * *  "
"   *   "
"  * *  "
" *   * "


    
    
    
    
  ]
  let canvasX = Canvas(
    width: 5,
    height: 5,
    pixels: serializeStringArray(pixelsX)
  )
  let letterX<- create Picture(canvas: canvasX)
  display (canvas: canvasX.canvas)
  destroy letterX
}
 