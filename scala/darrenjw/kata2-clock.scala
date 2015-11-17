/*
kata2-clock.scala

*/

import java.util.Calendar

object ClockApp
{

  case class Clock(evenSec: Boolean,fiveHr: Int, oneHr: Int, fiveMin: Int, oneMin: Int) {
    override def toString = {
      val r1 = if (evenSec) "*" else "O"
      val r2 = "*"*fiveHr+"-"*(4-fiveHr)
      val r3 = "*"*oneHr+"-"*(4-oneHr)
      val r4 = "*"*fiveMin+"-"*(11-fiveMin)
      val r5 = "*"*oneMin+"-"*(4-oneMin)
      r1+"\n"+r2+"\n"+r3+"\n"+r4+"\n"+r5
    }
  }

  object Clock {
    def apply(hr: Int, min: Int, sec: Int): Clock = 
     Clock(sec%2 == 0, hr/5, hr%5, min/5, min%5)
    def apply(dt: Calendar): Clock =
      Clock(dt.get(Calendar.HOUR_OF_DAY),
            dt.get(Calendar.MINUTE),
            dt.get(Calendar.SECOND))
    def apply(): Clock = Clock(Calendar.getInstance())
  }

  def main(args: Array[String]): Unit = {
    println(Clock())
  }

}

// eof


