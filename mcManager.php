<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

$serverAddress = 's-mine.org';

//--Set Time Zone
date_default_timezone_set('America/Phoenix');
$curlHeader = array(
	'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
	'Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7',
	'Accept-Language: en-us;q=0.8,en;q=0.6'
);
$curlUserAgent='Mozilla/5.0 (Windows; U; Windows NT 6.1; en; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13';
/*
This grabs the current https://minecraft.net/download page and parses it to get the url of the current vanilla server download.
*/
if( isset($_GET['getCurrentVersion']) )
{
	// Setup Connection
	$Socket = @FSockOpen( 'udp://'.$serverAddress, 25565, $ErrNo, $ErrStr, 3 );
	Stream_Set_Timeout( $Socket, 3 );
	Stream_Set_Blocking( $Socket, true );

	// Connect and Get Chanllenge Token
	$Command = Pack( 'c*', 0xFE, 0xFD, 0x09, 0x01, 0x02, 0x03, 0x04 );
	FWrite( $Socket, $Command, StrLen( $Command ) );
	$Data = SubStr( FRead( $Socket, 2048 ), 5 );
	// Get Challenge Token
	$Challenge =  Pack( 'N', $Data );
	
	// Get Info
	$Command = Pack( 'c*', 0xFE, 0xFD, 0x00, 0x01, 0x02, 0x03, 0x04 ).$Challenge . Pack( 'c*', 0x00, 0x00, 0x00, 0x00 );
	FWrite( $Socket, $Command, StrLen( $Command ) );
	$Data = SubStr( FRead( $Socket, 2048 ), 5 );

	// Convert to array
	$Data    = Explode( "\x00\x00\x01player_\x00\x00", SubStr( $Data, 11 ) );
	$Data    = Explode( "\x00", $Data[ 0 ] );
	
	// Find Version
	foreach( $Data as $Key => $Value )
	{
		if( $Value == 'version')
		{
			$version = $Data[$Key+1];
		}
		
	}
	
	// Close Connection
	FClose( $Socket );

	echo $version;
	//echo var_dump($Data);
}
else
{
	echo "Working";
}
?>