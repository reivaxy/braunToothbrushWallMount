

x = 30;
y = 50;
z = 3;
topOffset = 10;
supportX = 6;
supportZ = 20;

largeDiam = 10;
smallDiam = 9;


brosse();
// trou();

module brosse() {
  difference() {
    support();
    translate([topOffset -1, 8, supportZ - largeDiam/1.5 ])
      trou();
    translate([topOffset -1, y - 8 - largeDiam - largeDiam/8 , supportZ - largeDiam/1.5 ])
      trou();
  }
  
}

module trou() {
  translate([0, largeDiam/2, largeDiam/2])
    rotate(90, [0, 1, 0])
      cylinder(d1=largeDiam, d2=smallDiam, h=supportX + 2, $fn= 80);
}
  
module support() {  
  cube([x, y, z]);
  translate([topOffset, 0, 0])
    cube([supportX, y, supportZ]);
  translate([topOffset - supportX, 0, z])
    roundedInside(supportX, y);
  translate([topOffset + 2*supportX, y, z])
    rotate(180, [0, 0, 1])
      roundedInside(supportX, y);
}


module roundedInside(side, length) {
  difference() {
    cube([side, length, side]);
    translate([0, -1, side])
      rotate(-90, [1, 0, 0])
        cylinder(d=side*2, h=length + 2, $fn=80);
  }
  
}