/*
kata1-roman.scala
*/

object Roman
{

  def roman(dec: Int): String = {
    if (dec >= 1000) "M"+roman(dec-1000)
     else if (dec >= 900) "CM"+roman(dec-900)
     else if (dec >= 500) "D"+ roman(dec-500)
     else if (dec >= 400) "CD"+roman(dec-400)
     else if (dec >= 100) "C"+ roman(dec-100)
     else if (dec >=  90) "XC"+roman(dec-90)
     else if (dec >=  50) "L"+ roman(dec-50)
     else if (dec >=  40) "XL"+roman(dec-40)
     else if (dec >=  10) "X"+ roman(dec-10)
     else if (dec >=   9) "IX"+roman(dec-9)
     else if (dec >=   5) "V"+ roman(dec-5)
     else if (dec >=   4) "IV"+roman(dec-4)
     else if (dec >=   1) "I"+ roman(dec-1)
     else ""
  }

  def main(args: Array[String]): Unit = {
    (1 to 2015) foreach { x => println(x.toString+"\t"+roman(x)) }
  }

}


// eof


