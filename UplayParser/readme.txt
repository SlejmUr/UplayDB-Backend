This is Libary is reading and parsing any Ubisoft Cache file.
It can parse from Stream or from the disk.

It contains ALL the C# Protobuf files from upc (Uplay exe)

Usage:

1. Add to your project
2. Add "using UbiParser;"

3. Use it:

var parsedManifest = UbiParsers.ParseManifestFile("myUbiManifest");

or:

var parsedManifest = ParseManifestFile("myUbiManifest");


You can get all the stuff. Like the CompressionMethod from the manifest:

Console.WriteLine(parsedManifest.CompressionMethod);


Have fun!
Repo can be found in:
https://github.com/UplayDB/Ubi-Parser
