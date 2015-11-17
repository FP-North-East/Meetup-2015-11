/*
kata3-shells.scala

*/

object Shells
{

  def swap(pos: Int, sw: (Int,Int)): Int = sw match {
    case (x,y) => if (x == pos) y
                    else if (y == pos) x
                      else pos
  }

  @annotation.tailrec
  def swap(pos: Int, swps: List[(Int,Int)]): Int = swps match {
    case x :: xs => swap(swap(pos,x),xs)
    case Nil => pos
  }

  def main(args: Array[String]): Unit = {
    println(swap(0, List((0,1),(1,2),(1,0))))
  }

}

// eof


