# publish delta inverter metrics to mqtt server for home assistant

use strict;
use warnings;
use Device::Inverter::Delta;
use Net::MQTT::Simple "192.168.1.101"; #your mqtt server hostname
use JSON;

my $ha_mqtt_topic = 'homeassistant/inverter';
my $ha_mqtt_availability_topic = 'homeassistant/inverter/status';
my $ha_status = 'offline';

my $dev = new Device::Inverter::Delta(portname => '/dev/ttyUSB0',verbose => 0);
#  my $dev = new Device::Inverter::Delta(portname => 'COM3'); #windows
my %ha_data = (
          'ac_temp' => 0,
          'ac_power' => 0,
          'ac_daily_gen' => 0,
          'ac_voltage' => 0);
 
my $gen = $dev->ReadDailyGeneration();
if(defined($gen)){
    $ha_data{ac_daily_gen} = $gen;
    $ha_status = 'online';
    print "Daily Generation:".$ha_data{ac_daily_gen}." MWh\n";
    $ha_data{ac_voltage} = $dev->ReadACVoltage();
    if(defined($ha_data{ac_voltage})){
        print "AC Voltage: ".$ha_data{ac_voltage}." V\n";
    }
    $ha_data{ac_power} = $dev->ReadACPower();
    if(defined($ha_data{ac_power})){
        print "AC Power: ".$ha_data{ac_power}." W\n";
    }
    $ha_data{ac_temp} = $dev->ReadACTemp();
    if(defined($ha_data{ac_temp})){
        print "AC Temp: ".$ha_data{ac_temp}." C\n";
    }
    my $json = encode_json \%ha_data;
    retain $ha_mqtt_topic => $json;
}else{
    $ha_status = 'offline';
    print "Inverter Offline\n";
}
retain $ha_mqtt_availability_topic => $ha_status;
