package Device::Inverter::Delta;

use strict;
use warnings;
use Digest::CRC qw(crc16);

use Exporter qw(import);
our @EXPORT = qw( new ReadDCCurrent1 ReadDCVoltage1 ReadDCPower1 ReadDCCurrent2 ReadDCVoltage2 ReadDCPower2 ReadACCurrent ReadACVoltage ReadACPower ReadACFrequency ReadACCurrentAverage ReadACVoltageAverage ReadACPowerAverage ReadDailyGeneration ReadUptime ReadType ReadPart ReadSerialNumber ReadFirmwareVersion ReadDCTemp ReadACTemp ReadPowerAC);

my $onWindows = $^O eq "MSWin32" || $^O eq "cygwin";
if ($onWindows) {
    require Win32::SerialPort;
} else {
    require Device::SerialPort;
}

use constant READ_DC_CURRENT1 => 0x1001;
use constant READ_DC_VOLTAGE1 => 0x1002;
use constant READ_DC_POWER1 => 0x1003;
use constant READ_DC_CURRENT2 => 0x1004;
use constant READ_DC_VOLTAGE2 => 0x1005;
use constant READ_DC_POWER2 => 0x1006;
use constant READ_AC_CURRENT => 0x1007;
use constant READ_AC_VOLTAGE => 0x1008;
use constant READ_AC_POWER => 0x1009;
use constant READ_AC_FREQ => 0x110a;
use constant READ_AC_CURRENT_AVG => 0x1107;
use constant READ_AC_VOLTAGE_AVG => 0x1108;
use constant READ_AC_POWER_AVG => 0x1109;
use constant READ_DAILY_GENERATION => 0x1303;
use constant READ_UPTIME => 0x1304;
use constant READ_PART => 0x0008;
use constant READ_TYPE => 0x0000;
use constant READ_SERIALNO => 0x0001;
use constant READ_FWVERSION => 0x0040;
use constant READ_AC_TEMP => 0x2005;
use constant READ_DC_TEMP => 0x2106;
use constant READ_POWER_AC => 0x120a;

sub ReadDCCurrent1 {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_DC_CURRENT1, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadDCVoltage1 {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_DC_VOLTAGE1, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadDCPower1 {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_DC_POWER1, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadDCCurrent2 {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_DC_CURRENT2, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadDCVoltage2 {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_DC_VOLTAGE2, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadDCPower2 {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_DC_POWER2, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadACCurrent {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_AC_CURRENT, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadACVoltage {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_AC_VOLTAGE, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadACPower {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_AC_POWER, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadACFrequency {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_AC_FREQ, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadACCurrentAverage {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_AC_CURRENT_AVG, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadACVoltageAverage {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_AC_VOLTAGE_AVG, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadACPowerAverage {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_AC_POWER_AVG, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadDailyGeneration {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_DAILY_GENERATION, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadUptime {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_UPTIME, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadType {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_TYPE, inverter_id => $params{inverter_id});
    (defined($data) && (length($data) > 2)) ? return unpack('CCA*',$data) : return undef; # $typeof,$model,$value
}

sub ReadPart {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_PART, inverter_id => $params{inverter_id});
    (defined($data) && (length($data) > 0)) ? return unpack('A*',$data) : return undef; # $value (ascii?)
}

sub ReadSerialNumber {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_SERIALNO, inverter_id => $params{inverter_id});
    (defined($data) && (length($data) > 0)) ? return unpack('A*',$data) : return undef; # $value (ascii?)
}

sub ReadFirmwareVersion {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_FWVERSION, inverter_id => $params{inverter_id});
    (defined($data) && (length($data) == 3)) ? return unpack('CCC',$data) : return undef; # $version, $major, $minor
}

sub ReadDCTemp {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_DC_TEMP, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadACTemp {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_AC_TEMP, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub ReadPowerAC {
    my ($self, %params) = @_;
    $params{inverter_id} //= 1; #default inverter ID = 1
    my $data = $self->getValue(command => READ_POWER_AC, inverter_id => $params{inverter_id});
    defined($data) ? return unpack('n',$data) : return undef;
}

sub new {
    my $caller = shift;
    my $caller_is_ref = ref $caller;
    my $class = $caller_is_ref || $caller;
    my %params = @_;

    die "Parameter 'portname' is required" if not $params{portname};

    $params{baudrate} //= 19200;    #default 19200
    $params{parity} //= 'none';     #default none
    $params{databits} //= 8;        #default 8
    $params{stopbits} //= 1;        #default 1
    $params{datatype} //= 'raw';    #default raw
    $params{handshake} //= 'none';  #default none
    $params{timeout} //= 150;       #default 150ms
    $params{verbose} //= 0;         #default false

    my $port_name = $params{portname};
    my $verbose = $params{verbose};

    my $port_obj = ($onWindows
            ? new Win32::SerialPort($port_name, debug => $verbose)
            : new Device::SerialPort($port_name, debug => $verbose)
    ) or die "Can't open $port_name";
    $port_obj->baudrate($params{baudrate});
    $port_obj->parity($params{parity});
    $port_obj->databits($params{databits});
    $port_obj->stopbits($params{stopbits});
    $port_obj->datatype($params{datatype});
    $port_obj->handshake($params{handshake});
    $port_obj->read_const_time($params{timeout});
    $port_obj->write_settings or warn "Unable to write settings to $port_name";
    $port_obj->purge_all;

    my $self = bless {
        port_name        => $port_name,
        verbose          => $verbose,
        port_obj         => $port_obj,
    }, $class;

    return $self;
}

sub getValue {
    my ($self, %params) = @_;

    die "Parameter 'command' is required" if not defined($params{command});

    $params{inverter_id} //= 1; #default inverter ID = 1
    my $command = $params{command};
    my $inverter_id = $params{inverter_id};

    my $MAX_READ_BYTES = 256;

    my $STX = 0x02;
    my $TO_INVERTER = 0x05;
    my $FROM_INVERTER = 0x06;

    my $COMMAND_LENGTH = 0x02;
    my $ETX = 0x03;

    # send packet format:
    # BYTES HEX    DESC
    # 1     0x02   STX - start of text
    # 1     0x05   Address to send 0x05 = inverter, 0x06 = reader
    # 1     0x01   Inverter ID if more than one
    # 1     0x02   Length of Command with no data
    # 2     0x???? Inverter command
    # 2     0x???? CRC-16
    # 1     0x03   ETX - end of text

    # receive packet format:
    # BYTES HEX  DESC
    # 1     0x02   STX - start of text
    # 1     0x06   destination. 0x05 = inverter, 0x06 = reader
    # 1     0x01   Inverter ID if more than one
    # 1     0x??   Length of Command including response data
    # 2     0x???? Inverter command
    # ?     0x??.. data for command response
    # 2     0x???? CRC-16
    # 1     0x03   ETX - end of text

    my $buffer_out = pack('CCCn',$TO_INVERTER,$inverter_id,$COMMAND_LENGTH,$command);
    my $crc = crc16($buffer_out);
    $buffer_out = pack('C',$STX) . $buffer_out . pack('vC',$crc,$ETX); #crc16 packed in little-endian order
    if($self->{verbose}){
        print "SENDING:".unpack('H*', $buffer_out);
        printf(' CRC:%#x',$crc);
        print "/$crc ";
    }
    my $sent = $self->{port_obj}->write($buffer_out);
    if($self->{verbose}){ print "Sent ".$sent." bytes\n"};
    if(defined($sent) && $sent == length($buffer_out)){
        (my $count_in, my $buffer_in) = $self->{port_obj}->read(my $InBytes = $MAX_READ_BYTES);
        if($count_in && $count_in == length($buffer_in)){
            $count_in = length($buffer_in);
            my $data_size = $count_in - 9;
            my $check_crc = crc16(substr($buffer_in,1,$count_in-4)); # calc crc16 with STX, CRC16 and ETX removed
            my $data_in_packed = substr($buffer_in,6,$data_size);
            my $unpack_format = "CCCCnH".($data_size*2)."vC"; #data component is read as hex string - 2 hex digits per byte of data size
            (my $stx_in,my $dest_in,my $id_in,my $command_length_in,my $command_in, my $data_in, my $crc_in, my $etx_in) = unpack($unpack_format,$buffer_in);
            if($self->{verbose}){
                print "RECEIVED:".unpack('H*', $buffer_in);
                printf(' CRC:%#x',$crc_in);
                print "/$crc_in OK\n";
            }
            if(($stx_in == $STX) && ($dest_in == $FROM_INVERTER) && ($id_in > 0) && ($command_length_in > $COMMAND_LENGTH) && ($check_crc == $crc_in) && ($etx_in == $ETX)){
                return $data_in_packed;
            }else{
                if($self->{verbose}){
                    warn "malformed data from inverter\n";
                    return undef;
                }
            }
        }else{
            if(!$count_in){
                warn "Serial read failed.\n"
            }else{
                warn "Serial read incomplete. Read ".$count_in." bytes.\n"
            }
            return undef;
        }
    }else{
        if($self->{verbose}){
            if(!$sent){
                warn "Serial write failed.\n"
            }else{
                warn "Serial write incomplete.\n"
            }
        }
        return undef;
    }
}

1;
