use strict;
use warnings;
use Device::Inverter::Delta;

  my $dev = new Device::Inverter::Delta(portname => '/dev/ttyUSB0',verbose => 0);
#  my $dev = new Device::Inverter::Delta(portname => 'COM3');

  my $gen = $dev->ReadDailyGeneration(inverter_id => 1);
  if(defined($gen)){
      print "Daily Generation:".$gen." MWh\n";
  }else{
      print "Inverter Offline\n"
  }

  my( $fw1,$fw2,$fw3) = $dev->ReadFirmwareVersion();
  if($fw1){ print "Firmware: ".$fw1.":".$fw2.":".$fw3."\n";}

  my $part=$dev->ReadPart();
  if(defined($part)){
    print "part: ".$part."\n";
  }

  my( $model1, $model2,$model3)=$dev->ReadType();
  if(defined($model1)){
    print "model: ".$model1." : ".$model2." : ".$model3."\n";
  }
  my $dc_c1 = $dev->ReadDCCurrent1();
  if(defined($dc_c1)){
    print "DC Current1: ".$dc_c1."\n";
  }
  my $dc_v1 = $dev->ReadDCVoltage1();
  if(defined($dc_v1)){
    print "DC Voltage1: ".$dc_v1."\n";
  }
  my $dc_p1 = $dev->ReadDCPower1();
  if(defined($dc_p1)){
    print "DC Power1: ".$dc_p1."\n";
  }
  my $dc_c2 = $dev->ReadDCCurrent2();
  if(defined($dc_c2)){
    print "DC Current2: ".$dc_c2."\n";
  }
  my $dc_v2 = $dev->ReadDCVoltage2();
  if(defined($dc_v2)){
    print "DC Voltage2: ".$dc_v2."\n";
  }
  my $dc_p2 = $dev->ReadDCPower2();
  if(defined($dc_p2)){
    print "DC Power2: ".$dc_p2."\n";
  }
  my $ac_c1 = $dev->ReadACCurrent();
  if(defined($ac_c1)){
    print "AC Current: ".$ac_c1."\n";
  }
  my $ac_v1 = $dev->ReadACVoltage();
  if(defined($ac_v1)){
    print "AC Voltage: ".$ac_v1."\n";
  }
  my $ac_p1 = $dev->ReadACPower();
  if(defined($ac_p1)){
    print "AC Power: ".$ac_p1."\n";
  }
  my $ac_t1 = $dev->ReadACTemp();
  if(defined($ac_t1)){
    print "AC Temp: ".$ac_t1."\n";
  }
  my $dc_t1 = $dev->ReadDCTemp();
  if(defined($dc_t1)){
    print "DC Temp: ".$dc_t1."\n";
  }
  my $uptime = $dev->ReadUptime();
  if(defined($uptime)){
    print "Uptime: ".$uptime."\n";
  }
  my $ac_f1 = $dev->ReadACFrequency();
  if(defined($ac_f1)){
    print "AC Freq: ".$ac_f1."\n";
  }
