Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function ToVncPassword($password) {
    if ($password.Length -ne 8) {
        throw 'password length must be exactly 8 bytes'
    }
    $r = @()
    $hex = ./vncpassword.exe (([System.Text.Encoding]::ASCII.GetBytes($password) | ForEach-Object ToString x2) -join '')
    for ($i = 0; $i -lt $hex.Length; $i += 2) {
		$r += [byte]::Parse($hex.Substring($i, 2), 'HexNumber')
    }
    $r
}

$actual = ToVncPassword "vagrant`0"
$expected = @(60, 137, 244, 70, 109, 194, 166, 122) # 3c89f4466dc2a67a
if (Compare-Object $actual $expected) {
    throw "ERROR $actual -ne $expected"
}
