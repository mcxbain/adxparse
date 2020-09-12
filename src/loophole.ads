pragma SPARK_Mode(on);

package Loophole is


procedure Run;

procedure Add(Number: in out Integer) with Global => null, Depends => (Number => Number);

end Loophole;
